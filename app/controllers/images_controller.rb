class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index, :show]
  # GET /images
  # GET /images.json
  def index
    @images = Image.all
  end

  # GET /images/1
  # GET /images/1.json
  def show
    @comments = Comment.where(:image_id => params[:id])
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images
  # POST /images.json
  def create
    @image = Image.new(name: image_params["name"], picture: image_params["picture"], image_file_name:image_params["image_file_name"], user_id: current_user.id)
      if @image.save
        redirect_to images_path
      else
        render 'new'
      end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    @image.update(image_params)
    redirect_to '/images'
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    flash[:notice] = "Image successfully deleted"
    redirect_to '/images'

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:name, :picture, :image)
    end
end
