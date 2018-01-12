class AdminController < ApplicationController
  before_action :authenticate_user!

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
    @users = User.all
  end

  def reset_password
    @user = User.find params[:id]
    respond_to do |format|
      format.html { render "reset_password" }
    end
  end

  def new
    @user = User.new
    respond_to do |format|
      format.html { render "new" }
    end
  end

  def update
    @user = User.find params[:id]
    respond_to do |format|
      if @user.update_attribute(:password, params[:user][:password])
        format.html { redirect_to admin_index_path, notice: 'User was successfully updated.' }
      else
        format.html { render "reset_password" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @user = User.new(email: params[:user][:email], password: params[:user][:password], role: params[:user][:role])
    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_index_path, notice: 'User was successfully created.' }
      else
        format.html { render "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find params[:id]
    respond_to do |format|
      if @user.delete
        format.html { redirect_to admin_index_path, notice: 'User was successfully deleted.' }
      else
        format.html { redirect_to admin_index_path }
      end
    end
  end

end
