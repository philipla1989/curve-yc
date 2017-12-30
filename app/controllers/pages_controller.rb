class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  # GET /stories
  # GET /stories.json
  def index
    @pages = Page.all
  end

  # GET /stories/1
  # GET /stories/1.json
  def show
    @page = Page.find params[:id]
  end

  # GET /stories/new
  def new
    @page = Page.new
  end

  # GET /stories/1/edit
  def edit
    @page = Page.find params[:id]
  end

  # POST /stories
  # POST /stories.json
  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to admin_path, notice: 'Page was successfully created.' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { redirect_to admin_path, notice: "Can't Create #{@page.errors.messages}"  }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stories/1
  # PATCH/PUT /stories/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to admin_path, notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { redirect_to admin_path, notice: "Can't update #{@page.errors.messages}"  }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to admin_path, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:name, :content)
    end
end
