class UsersController < ApplicationController
  layout "application"
  before_action :sign_in_user

  def show
    @user = User.find(params[:id])
  end

end
