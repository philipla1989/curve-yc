class HomeController < ApplicationController

  def index
    @stories = Story.all
    @ids = @stories.pluck(:id)
  end

  def browse
  end

  def about
  end

  def blog
    @posts = Post.all
  end

  def submit_story
  end

  def contact
  end

  def filter_by
    search_ini = params[:ini_career_path] == "Anything" ? "" : params[:ini_career_path]
    search_sub = params[:sub_career_path] == "Anything" ? "" : params[:sub_career_path]
    @stories = Story.where("ini_career_path ilike :search", search: "%#{search_ini}%")
    @stories = @stories.sub_career.where("careers.name ilike :search", search: "%#{search_sub}%").uniq
    @ids = @stories.pluck(:id)
  end

  def sort_by
    ids = params[:ids].map(&:to_i)
    @stories = Story.where(id: ids)
    @careers = Career.where(story_id: ids)
    case params[:value]
      when "Newest"
        @stories = @stories.order(created_at: :desc)
      when "Oldest"
        @stories = @stories.order(created_at: :asc)
      when "Longest"
        order_longest(@stories)
      when "Shortest"
        order_shortest(@stories)
      else
        @stories = Story.where(id: ids)
    end
  end

  def order_longest(stories)
    get_order_array(stories)
    @stories = Story.where(id: @ids)
  end

  def order_shortest(stories)
    get_order_array(stories)
    @stories = Story.find(@ids).sort_by {|m| @ids.reverse.index(m.id)}
  end

  def get_order_array(stories)
    hash = Hash.new{|hsh,key| hsh[key] = {} }
    @ids = []
    stories.each do |story|
      if story.careers.present?
        size = 0
        story.careers.each do |career|
          size += career.story_questions.size
        end
        hash["story_#{story.id}"].store 'size', size
      else
        hash["story_#{story.id}"].store 'size', 0
      end
      hash["story_#{story.id}"].store 'story_id', story.id
    end
    hash.each do |key, val|
      @ids << val["story_id"]
    end
  end

  def browse_explore
    @career_path = {}
    @sub_career = Hash.new{|hsh,key| hsh[key] = {} }
    ini_career = Story.all.order(:ini_career_path).map(&:ini_career_path).uniq
    ini_career.each do |career_path|
      stories = Story.where(ini_career_path: career_path)
      stories.each do |story|
        if story.careers.count > 1
          @sub_career[career_path] = @sub_career[career_path].present? ?
                                     @sub_career[career_path] << story.careers.where.not(name: career_path).map(&:name) :
                                     story.careers.where.not(name: career_path).map(&:name)
        else
          @sub_career[career_path] = @sub_career[career_path].present? ? @sub_career[career_path] << story.careers.first.name :
                                     story.careers.map(&:name)
        end
        @career_path = @career_path.deep_merge(@sub_career)
      end
    end
  end

  def browse_pursue
    @career_pursue = {}
    @career_path = Hash.new{|hsh,key| hsh[key] = {} }
    sub_career = Career.all.map(&:name).uniq.sort
    sub_career.each do |career_path|
      careers = Career.where(name: career_path)
      careers.each do |career|
        if career.precedent_career.include?("Initial")
          @career_path[career_path] = (@career_path[career_path].present? ?
                                      @career_path[career_path] << career.story.ini_career_path :
                                      [ career.story.ini_career_path ]) if @career_path[career_path] != [ career.story.ini_career_path ]
        else
          last_career = career.story.careers.order(:created_at).last.name
          career_array = [ career_path ] << last_career
          if  career.name == last_career
            @career_path[career_path] = (@career_path[career_path].present? ?
                                        @career_path[career_path] << career.story.ini_career_path :
                                        [ career.story.ini_career_path ])
          else
            @career_path[career_path] = (@career_path[career_path].present? ?
                                        @career_path[career_path] << career.name :
                                        career.story.careers.order(:created_at).where.not(name: career_array).map(&:name)) if @career_path[career_path] != [ career.name ]
          end
        end
        @career_pursue = @career_pursue.deep_merge(@career_path)
      end
    end
  end

  def browse_stories
    search_ini = params[:ini_career] == "Anything" ? "" : params[:ini_career]
    search_sub = params[:sub_career] == "Anything" ? "" : params[:sub_career]
    @stories = Story.where("ini_career_path ilike :search", search: "%#{search_ini}%")
    @stories = @stories.sub_career.where("careers.name ilike :search", search: "%#{search_sub}%").uniq
    @ids = @stories.pluck(:id)
    @title = [params[:ini_career], params[:sub_career]]
    respond_to do |format|
      format.html { render :stories }
    end
  end

end
