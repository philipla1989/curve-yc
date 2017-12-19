class AdminController < ApplicationController

  def index
    @stories = Story.all
    @story = Story.new
  end
end
