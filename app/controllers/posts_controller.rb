class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def create
    # @post = current_user.posts.build(post_params)
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
  end

  private

  def post_params
    params.require(:post).permit(:content, :photo)
  end
end
