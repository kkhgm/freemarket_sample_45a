class UsersController < ApplicationController
  layout "application"
  before_action :sign_in_user

  def show
    @user = User.find(params[:id])
    @items = Item.where('seller_id = ?', @user)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(user_profile_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  private
  def user_profile_params
    params.require(:user).permit(:nickname, :introduction)
  end

end
