class CategoriesController < ApplicationController
  before_action :authenticate_admin!

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = 'New Category Created'
      redirect_to
    else
      render 'new'
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = 'Category Updated'
      redirect_to categories_path
    else
      render 'edit'
    end
  end

  def index
    @categories = Category.all
  end

  def destroy
    @category = Category.find(params[:id]).destroy
    flash[:notice] = 'Category Deleted'
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
