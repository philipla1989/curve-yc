class StoryQuestionsController < ApplicationController
  before_action :set_story_question, only: [:show, :edit, :update, :destroy]

  # GET /story_questions
  # GET /story_questions.json
  def index
    @career = Career.find params[:career_id]
    @story_question = StoryQuestion.new
    @story = @career.story
  end

  # GET /story_questions/1
  # GET /story_questions/1.json
  def show
  end

  # GET /story_questions/new
  def new
    @story_question = StoryQuestion.new
  end

  # GET /story_questions/1/edit
  def edit
    @story_question = StoryQuestion.find params[:id]
    @career = @story_question.career
    @story = @career.story
  end

  # POST /story_questions
  # POST /story_questions.json
  def create
    @story_question = StoryQuestion.new(story_question_params)
    respond_to do |format|
      if @story_question.save
        @story_question = StoryQuestion.new
        format.html { redirect_to story_career_story_questions_path, notice: 'Story question was successfully created.' }
        format.json { render :show, status: :created, location: @story_question }
      else
        format.html { redirect_to story_questions_path(story_id: @story), notice: "#{@story_question.errors.messages}" }
        format.json { render json: @story_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /story_questions/1
  # PATCH/PUT /story_questions/1.json
  def update
    respond_to do |format|
      if @story_question.update(story_question_params)
        @career = @story_question.career
        @story = @career.story
        @story_question = StoryQuestion.new
        format.html { redirect_to story_career_story_questions_path(@story, @career, @story_question), notice: 'Story question was successfully updated.' }
        format.json { render :show, status: :ok, location: @story_question }
      else
        format.html { render :edit }
        format.json { render json: @story_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /story_questions/1
  # DELETE /story_questions/1.json
  def destroy
    @career = @story_question.career
    @story = @career.story
    @story_question.destroy
    respond_to do |format|
      @story_question = StoryQuestion.new
      format.html { redirect_to story_career_story_questions_path(@story, @career, @story_question), notice: 'Story question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story_question
      @story_question = StoryQuestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def story_question_params
      params.require(:story_question).permit(:story_id, :question, :response, :career_id).merge(career_id: params[:career_id])
    end
end
