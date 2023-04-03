class CommentsController < ApplicationController
    
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy 
    redirect_to article_path(@comment.article)
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params.merge(user: current_user))
    @comment.save

    if @comment.save
      redirect_to article_path(@article)
    else
      render 'articles/show'
    end
  end

    private

  def comment_params
    params.require(:comment).permit(:body)
  end
end