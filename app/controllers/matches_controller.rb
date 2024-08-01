class MatchesController < ApplicationController
  before_action :authenticate_user!

  def create
    @matched_user = User.find(params[:matched_user_id])
    @match = Match.new(matched_user: @matched_user)
    @match.user = current_user
    @match.status = :pending

    # if @match.save
    #   render json: { success: "Match request sent." }, status: :created
    # else
    #   render json: { error: "Something went wrong" }, status: :unprocessible_entity
    # end
    if @match.save
      flash[:notice] = "Match request sent."
      redirect_to posts_path
    else
      flash[:alert] = @match.errors.full_messages.join(", ")
      redirect_to posts_path
    end
  end

  def update
    @match = Match.find(params[:id])

    if @match.matched_user == current_user && @match.update(match_params)
      render json: { success: "Match request accepted!" }, status: :ok
    else
      render json: { error: "Match request declined" }, status: :unprocessable_entity
    end
  end

  def index
    # shows all matches that are involved with the two users interacting
    # match requests and pending sent matches
    @match = Match.all.includes(:user)
  end

  private

  def match_params
    params.require(:match).permit(:status)
  end
end
