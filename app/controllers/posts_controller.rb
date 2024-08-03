class PostsController < ApplicationController
before_action :set_post, only: [:show, :destroy]

  before_action :find_post, only: [:show, :destroy]
  def index
    @posts = Post.all.includes(:user, :likes)
    @user = current_user
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def new
    @post = Post.new
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.build
  end

  private
  
  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :photo)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
