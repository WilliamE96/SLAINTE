class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def new
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
