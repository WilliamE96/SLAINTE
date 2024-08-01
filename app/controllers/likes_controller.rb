class LikesController < ApplicationController
  before_action :find_like, only: [:destroy]
  before_action :find_post, only: [:create]
  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      Like.create!(user: current_user, post: @post)
    end
    redirect_back fallback_location: posts_path
  end

  def destroy
    @like.destroy

    redirect_back fallback_location: posts_path
  end

  def find_like
    @like = Like.find(params[:id])
  end

  private
  def find_post
    @post = Post.find(params[:post_id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, post_id:
    params[:post_id]).exists?
  end

end
