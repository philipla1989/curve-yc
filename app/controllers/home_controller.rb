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
        @stories.order(created_at: :desc)
      when "Oldest"
        @stories.order(created_at: :asc)
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

end
