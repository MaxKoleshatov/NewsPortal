class WelcomeController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    if @category = Category.find_by("id = ?", params[:category][:category_id])
      redirect_to category_path(@category)
    else 
      redirect_to root_path, notice: "Нужно выбрать категорию"
    end
  end
end