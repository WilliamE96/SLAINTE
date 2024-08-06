class MatchesController < ApplicationController
  before_action :authenticate_user!

  def create
    @matched_user = User.find(params[:matched_user_id])
    @match = Match.new(matched_user: @matched_user, user: current_user, status: :pending)
    @match.user = current_user

    if @match.save
      flash[:notice] = "Match request sent."
      redirect_to posts_path
    else
      flash[:alert] = @match.errors.full_messages.join(", ")
      redirect_to posts_path
    end
  end

  def update
    @match = current_user.received_matches.find(params[:id])

    if @match.update(match_params)
      flash[:notice] = "Match was accepted by #{@matched_user}"
    else
      flash[:notice] = "Match was rejected by #{@matched_user}"
    end
  end

  def index
    @sent_matches = current_user.sent_matches.where(status: :pending)
    @received_matches = current_user.received_matches.where(status: :pending)
    @accepted_matches = current_user.received_matches.where(status: :accepted)

  end

  def accept
    @match = current_user.received_matches.find(params[:id])
    if @match.update(status: :accepted)
      flash[:notice] = "Match accepted!"
    else
      flash[:alert] = "Failed to accept the match."
    end
    redirect_to matches_path
  end

  def reject
    @match = current_user.received_matches.find(params[:id])
    if @match.update(status: :rejected)
      flash[:notice] = "Match rejected!"
    else
      flash[:alert] = "Failed to reject the match."
    end
    redirect_to matches_path
  end

  private

  def match_params
    params.require(:match).permit(:status)
  end
end
