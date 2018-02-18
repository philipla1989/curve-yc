class HomeController < ApplicationController

  def index
    @stories = Story.all
    @ids = @stories.pluck(:id)
    @title = "Curve Your Career"
    @description = "Find fulfillment and happiness in your job. Hear about how people just like you were able to change careers."
  end

  def browse
    @title = "Curve Your Career | Browse"
    @description = "Browse stories based on what career changes are most relevant to you, ranging from people who started in Accounting to Software Development."
  end

  def about
    @title = "Curve Your Career | About"
    @description = "At Curve Your Career, you can browse stories from those who have been able to change their careers. You can learn about how they overcame barriers just like yours and what steps they took to make the transition."
  end

  def blog
    @title = "Curve Your Career | Blog"
    @description = "The best tips around how to overcome barriers and steps to changing your career"
    @content = {}
    @topics = Post.all.order(:topic).map(&:topic)
    @topics.each do |topic|
      @content[topic] = Post.where(topic: topic)
    end
  end

  def submit_story
    @title = "Curve Your Career | Submit"
    @description = "Share your own career change story so others gain the courage and guidance to change too."
  end

  def contact
    @title = "Curve Your Career | Contact"
    @description = "Interested in helping out with this project, sharing your insights, or just connecting with me? Email me at curveyourcareer@gmail.com"
  end

  def filter_by
    @search_ini = params[:ini_career_path] == "Anything" ? "" : params[:ini_career_path]
    @search_sub = params[:sub_career_path] == "Anything" ? "" : params[:sub_career_path]
    @stories = []
    stories_sub = Story.sub_career.where("careers.ini_career_path ilike :search AND careers.precedent_career != :search_i",
                                        search: "%#{@search_sub}%", search_i: "Initial")
    stories_ini = Story.sub_career.where("careers.ini_career_path ilike :search AND careers.precedent_career ilike :search_i",
                                        search: "%#{@search_ini}%", search_i: "Initial")
    stories_ini.each do |story|
      @stories << story if (story.careers.where("ini_career_path ilike :search AND precedent_career != :search_s",
                                                search: "%#{@search_sub}%", search_s: "Initial").count == 1)
    end
    stories_sub.each do |story|
      @stories << story if (story.careers.where(precedent_career: @search_ini).count == 1)
    end
    @stories = @stories.uniq
    @ids = @stories.pluck(:id)
    @search_ini = "Anything" if @search_ini.empty?
    @search_sub = "Anything" if @search_sub.empty?
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
    @title = "Curve Your Career | Browse | Explore"
    @description = "Browse career change stories based on your current career."
    @career_path = {}
    @sub_career = Hash.new{|hsh,key| hsh[key] = {} }
    careers =  Career.where(precedent_career: "Initial").map(&:ini_career_path).uniq
    careers.each do |career|
      stories = Story.sub_career.where("careers.ini_career_path = ? AND careers.precedent_career = ?", career, "Initial")
      stories.each do |story|
        careers_array = story.careers.where.not(ini_career_path: career, precedent_career: "Initial")
        @precedent_career = ""
        careers_array.each do |career_item|
          if career_item.precedent_career == @precedent_career
            @sub_career[career_item.precedent_career] = @sub_career[career_item.precedent_career].present? ?
                                    @sub_career[career_item.precedent_career] << career_item.ini_career_path : [ career_item.ini_career_path ]
            @sub_career[career] = @sub_career[career].present? ?
                                    @sub_career[career] << career_item.ini_career_path : [ career_item.ini_career_path ]
          else
            @sub_career[career] = @sub_career[career].present? ?
                                @sub_career[career] << career_item.ini_career_path : [ career_item.ini_career_path ]
          end
          @precedent_career = career_item.ini_career_path
        end
        @career_path = @career_path.deep_merge(@sub_career)
      end
    end
  end

  def browse_pursue
    @title = "Curve Your Career | Browse | Purse"
    @description = "Browse career change stories based on the specific career you want to transition into."
    @career_pursue = {}
    @career_path = Hash.new{|hsh,key| hsh[key] = {} }
    @story_ids = []
    careers =  Career.where.not(precedent_career: "Initial")
    careers.each do |career|
      stories = Story.sub_career.where("careers.ini_career_path = ?", career.ini_career_path)
      stories.each do |story|
        if story.careers.count > 2
          @careers_added = []
          unless @story_ids.include?(story.id)
            story.careers.where.not(precedent_career: "Initial").order(created_at: :desc).each do |career_item|
              @careers_added << career_item.ini_career_path
              @career_path[career_item.ini_career_path] = @career_path[career_item.ini_career_path].present? ?
                                                        @career_path[career_item.ini_career_path] << story.careers.where.not(ini_career_path: @careers_added).map(&:ini_career_path) :
                                                        story.careers.where.not(ini_career_path: @careers_added).map(&:ini_career_path)
            end
            @story_ids << story.id
          end
        else
          @career_path[career.ini_career_path] = @career_path[career.ini_career_path].present? ?
                                            @career_path[career.ini_career_path] << career.precedent_career :
                                            [career.precedent_career]
          @career_path[career.ini_career_path] = @career_path[career.ini_career_path].uniq
        end
      end
      @career_pursue = @career_pursue.deep_merge(@career_path)
    end
  end

  def browse_stories
    @search_ini = params[:ini_career] == "Anything" ? "" : params[:ini_career]
    @search_sub = params[:sub_career] == "Anything" ? "" : params[:sub_career]
    @stories = []
    stories_sub = Story.sub_career.where("careers.ini_career_path ilike :search AND careers.precedent_career != :search_i",
                                        search: "%#{@search_sub}%", search_i: "Initial")
    stories_ini = Story.sub_career.where("careers.ini_career_path ilike :search AND careers.precedent_career ilike :search_i",
                                        search: "%#{@search_ini}%", search_i: "Initial")
    stories_ini.each do |story|
      @stories << story if (story.careers.where("ini_career_path ilike :search AND precedent_career != :search_s",
                                                search: "%#{@search_sub}%", search_s: "Initial").count == 1)
    end
    stories_sub.each do |story|
      @stories << story if (story.careers.where(precedent_career: @search_ini).count == 1)
    end
    @stories = @stories.uniq
    #
    #@stories_ini = Story.sub_career.where("careers.ini_career_path ilike :search AND careers.precedent_career ilike :search_i",
    #                                  search: "%#{search_ini}%", search_i: "%Initial%")
    #@stories_sub = Story.sub_career.where("careers.ini_career_path ilike :search", search: "%#{search_sub}%")
    #@stories = @stories_ini + @stories_sub
    #@stories = @stories.uniq
    @ids = @stories.pluck(:id)
    @title = [params[:ini_career], params[:sub_career]]
    respond_to do |format|
      format.html { render :stories }
    end
  end

  def dynamic_filter
    @values = []
    case params[:type]
      when "ini_career"
        search_ini = params[:career] == "Anything" ? "" : params[:career]
        stories_i = Story.sub_career.where("careers.ini_career_path ilike :search AND precedent_career ilike :search_i",
                                          search: "%#{search_ini}%", search_i: "Initial")
        stories_p = Story.sub_career.where("careers.precedent_career ilike :search", search: "%#{search_ini}%")
        @stories = stories_i + stories_p
        @stories.uniq.each do |story|
          story.careers.each do |career|
            @values << career.ini_career_path if (career.precedent_career != "Initial" && career.ini_career_path != search_ini)
          end
        end
        @values = @values.sort!
        @type = :ini_career
      when "sub_career"
        search_ini = ""
        search_sub = params[:career] == "Anything" ? "" : params[:career]
        stories = Story.sub_career.where("careers.ini_career_path ilike :search AND careers.precedent_career != :search_s",
                                            search: "%#{search_sub}%", search_s: "Initial")
        stories.uniq.each do |story|
          story.careers.each do |career|
            @values << career.ini_career_path if ( career.precedent_career != search_sub && career.ini_career_path != search_sub)
          end
        end
        @values = @values.sort!
        @type = :sub_career
      else
        search_ini = ""
        search_sub = ""
    end
    @values = @values.uniq
    respond_to do |format|
      format.json  { render json: [@values, @type] }
    end
  end

end
