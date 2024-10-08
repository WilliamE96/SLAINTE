class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def friends
    @friends = current_user.matches.where(status: "accepted")
  end

  def chats
    @friends = Match.where(user_id: current_user).or(Match.where(matched_user_id: current_user)).where(status: "accepted")
  end
end
