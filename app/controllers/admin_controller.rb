class AdminController < ApplicationController

  def index
    @stories = Story.all
    @story = Story.new
    @story_question = StoryQuestion.new
    @categories = Category.all
    @category = Category.new
    @pages = Page.all
    @page = Page.new
    @posts = Post.all
    @post = Post.new
  end

end
