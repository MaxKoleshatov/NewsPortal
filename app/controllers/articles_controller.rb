class ArticlesController < ApplicationController
  # before_action :authenticate_user!
    def index
    #   @categories = Category.all        
    end

    def new
      @category = Category.find(params[:category_id])
      # @article = Article.new
      @article = @category.articles.new
    end

    def show
      @article = Article.find(params[:id])
      # @article = @category.articles.new
    end

    def create
      @category = Category.find(params[:category_id])
      @article = @category.articles.new(articles_params)
      @article.user = current_user

      if @article.save
        redirect_to category_path(@category), notice: "Вы создали статью, она появится тут когда пройдет модерацию"
      else
        render :new
      end
    end

    def destroy
      @article = Article.find(params[:id])
      @article.destroy
      redirect_to category_path(@article.category)
      
      
    end

    private

    def articles_params
      params.require(:article).permit(:title, :body, :announcement)
    end
  end