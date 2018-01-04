class HomeController < ApplicationController

  def index
    @stories = Story.all
  end

  def about
  end

  def blog
  end

  def submit_story
  end

  def contact
  end

  def filter_by
    search_ini = params[:ini_career_path] == "Anything" ? "" : params[:ini_career_path]
    search_sub = params[:sub_career_path] == "Anything" ? "" : params[:sub_career_path]
    @stories = Story.where("ini_career_path ilike :search", search: "%#{search_ini}%")
    @stories = @stories.sub_career.where("careers.name ilike :search", search: "%#{search_sub}%")
  end

  def sort_by
    binding.pry
  end
end
