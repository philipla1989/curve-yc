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
end
