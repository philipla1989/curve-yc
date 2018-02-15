class CareersController < ApplicationController
  before_action :set_career, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]

  # GET /careers
  # GET /careers.json
  def index
    @story = Story.find params[:story_slug]
    @careers = @story.careers.order(:created_at)

  end

  # GET /careers/1
  # GET /careers/1.json
  def show
    @story = Story.find params[:story_id]
  end

  # GET /careers/new
  def new
    @career = Career.new
    @story = Story.find params[:story_slug]
  end

  # GET /careers/1/edit
  def edit
    @story = Story.find params[:story_slug]
  end

  # POST /careers
  # POST /careers.json
  def create
    params[:story_id] = Story.where(slug: params[:story_slug].gsub("-", " ")).first.id
    @career = Career.new(career_params)
    respond_to do |format|
      if @career.save
        @story = @career.story
        format.html { redirect_to story_careers_path(@story.id), notice: 'Career was successfully created.' }
        format.json { render :show, status: :created, location: @career }
      else
        format.html { render :new }
        format.json { render json: @career.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /careers/1
  # PATCH/PUT /careers/1.json
  def update
    params[:story_id] = Story.where(slug: params[:story_slug].gsub("-", " ")).first.id
    respond_to do |format|
      if @career.update(career_params)
        @story = @career.story
        format.html { redirect_to story_careers_path(@story.id), notice: 'Career was successfully updated.' }
        format.json { render :show, status: :ok, location: @career }
      else
        format.html { render :edit }
        format.json { render json: @career.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /careers/1
  # DELETE /careers/1.json
  def destroy
    @story = @career.story
    @career.destroy
    respond_to do |format|
      format.html { redirect_to story_careers_path(@story.id), notice: 'Career was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_career
      @career = Career.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def career_params
      params[:career][:industry] = params[:career][:industry].reject { |c| c.empty? }
      params[:career][:industry] = params[:career][:industry].join(", ")
      params.require(:career).permit(:name, :title, :industry, :company, :company_type, :story_id, :precedent_career).merge(story_id: params[:story_id])
    end
end
