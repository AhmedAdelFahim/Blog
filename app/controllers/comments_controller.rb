class CommentsController < ApplicationController
  def create
    p "8"*100
    # p params
    # p Post.find(params[:format]).comments
    # post_params = params.permit(:title, :content)
    comment_params = params.permit(:comment)
    @comment = Post.find(params[:format]).comments.create(comment_params)
    if @comment.persisted?
      redirect_to action: :show , :controller => :posts , format: params[:format]
    else
      redirect_to action: :show , :controller => :posts , format: params[:format], error: "Comment can't be blank"
    end
  end

  def destroy
    # p "%"*100
    # p params
    @comment = Post.find(params[:post_id]).comments.find(params[:format])
    @comment.delete
    redirect_to action: :show , :controller => :posts , format: params[:post_id]
  end
end
