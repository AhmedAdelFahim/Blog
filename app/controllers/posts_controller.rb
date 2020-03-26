class PostsController < ApplicationController
  def index
    @posts = User.find(1).posts.order(updated_at: 'desc')
  end

  def new
    @post = Post.new
  end

  def update
    # p "-"*100
    # p params
    @post = Post.find(params[:format])
    if @post.update(post_params)
      redirect_to action: :index , :controller => :posts
    else
      render :edit
    end
  end

  def edit
    # p params
    @post = Post.find(params[:format])
  end

  def destroy
    @post = Post.find(params[:format])
    @post.delete
    redirect_to action: :index , :controller => :posts
  end

  def show
    @post = User.find(1).posts.find(params[:format])
    @comments = @post.comments
  end

  def create
    # post_params = params.permit(:title, :content)
    @post = User.find(1).posts.create(post_params)
    if @post.persisted?
      redirect_to action: :index , :controller => :posts
    else
      render :new
    end
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
