class ImagesController < ApplicationController
  before_action :authenticate_admin!, except: [:index]

	def new
		@image = Image.new
	end

	def create
		@image = Image.new(image_params)
		if @image.save
			flash[:notice] = 'New Image Uploaded'
			redirect_to gallery_path
		else
			render 'new'
		end
	end

	def show
		@image = Image.find(params[:id])
	end

  def edit
  	@image = Image.find(params[:id])
  end

  def update
  	@image = Image.find(params[:id])
    if @image.update(image_params)
      flash[:notice] = "Image Updated"
      redirect_to gallery_path
    else
      render 'edit'
    end
  end

  def index
    @images = Image.order('id DESC')
    @categories = Category.all
  end

  def destroy
  	@image = Image.find(params[:id]).destroy
  	flash[:notice] = 'Image Deleted'
  	redirect_to gallery_path
  end

  private

  def image_params
  	params.require(:image).permit(:image, :image_title, :image_description, :category_id, :front_page_image)
  end
end
