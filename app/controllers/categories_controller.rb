class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    # @category = Category.new        
  end
  def show
    @category = Category.find(params[:id])
    # @article = @category.articles.new
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(categories_params)
    if @category.save
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def categories_params
    params.require(:category).permit(:title)
  end
end