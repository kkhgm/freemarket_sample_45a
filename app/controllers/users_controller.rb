class UsersController < ApplicationController
  layout "application"

  def show
    @user = User.find(params[:id])
  end

  def privacy
  end

end
