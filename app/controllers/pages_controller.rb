class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def friends
    @friends = current_user.matches.where(status: "accepted")
  end
end
