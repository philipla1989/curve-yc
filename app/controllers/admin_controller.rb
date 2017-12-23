class AdminController < ApplicationController

  def index
    @stories = Story.all
    @story = Story.new
    @story_question = StoryQuestion.new
  end
end
