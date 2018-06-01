class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]

  # GET /stories
  # GET /stories.json
  def index
    @stories = Story.all
  end

  # GET /stories/1
  # GET /stories/1.json
  def show
    @careers = @story.careers    
    @title = @story.story_meta_title.present? ? @story.story_meta_title : @story.slug    
    initial_career = @story.careers.where(precedent_career: "Initial").first.ini_career_path
    sub_career =  @story.careers.where(precedent_career: initial_career).first.ini_career_path
    @stories = Story.sub_career.where("careers.ini_career_path ilike :search OR careers.precedent_career ilike :search_i", 
      search: "%#{initial_career}%", search_i: "%#{sub_career}%" ).limit(3).uniq
    if @stories.count <=2
      @stories = Story.order(created_at: :desc).limit(3).uniq
    end                      
    render(:layout => "layouts/story-layout")
  end

  # GET /stories/new
  def new
    @story = Story.new
  end

  # GET /stories/1/edit
  def edit
    #@story.ini_industry = @story.ini_industry.split(",")
  end

  # POST /stories
  # POST /stories.json
  def create
    @story = Story.new(story_params)    
    respond_to do |format|
      if @story.save        
        if params[:story][:avatar].present?
          avatar = Cloudinary::Uploader.upload(params[:story][:avatar])
          @story.update_attribute(:avatar, avatar["url"])
        end
        format.html { redirect_to admin_index_path, notice: 'Story was successfully created.' }
        format.json { render :show, status: :created, location: @story }
      else
        format.html { redirect_to admin_index_path, notice: "Can't Create #{@story.errors.messages}"  }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stories/1
  # PATCH/PUT /stories/1.json
  def update       
    respond_to do |format|
      if @story.update(story_params)        
        if params[:story][:avatar].present? && @story.avatar != params[:story][:avatar]
          avatar = Cloudinary::Uploader.upload(params[:story][:avatar])
          @story.update_attribute(:avatar, avatar["url"])          
        end        
        format.html { redirect_to admin_index_path, notice: 'Story was successfully updated.' }
        format.json { render :show, status: :ok, location: @story }
      else
        format.html { redirect_to admin_index_path, notice: "Can't update #{@story.errors.messages}"  }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
    @story.destroy
    respond_to do |format|
      format.html { redirect_to admin_index_path, notice: 'Story was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story
      @story = Story.find_by slug: params[:slug].gsub("-", " ")
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def story_params
      params[:story][:slug] = params[:story][:slug].downcase
      params.require(:story).permit(:name, :location, :linkedin_url, :slug, :quote, :ini_age, :sub_age,
                                    :ini_title, :ini_career_path, :ini_industry, :ini_company, :ini_company_type,
                                    :sumary, :education, :meta_name, :meta_content, :story_meta_title, :avatar,
                                    {careers_attributes: [:id, :ini_career_path, :precedent_career, :_destroy,
                                                        {jobs_attributes: [:id, :title, :company, :industry, :age, :company_type, :_destroy ]}
                                                     ]}
                                    )
    end
end
