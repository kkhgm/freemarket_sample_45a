class AddressesController < ApplicationController
  def new
    @prefectures = Prefecture.all
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @prefectures = Prefecture.all
    if @address.save
      redirect_to new4_user_registration_path
    else
      render :new
    end
  end

  def edit
    @prefectures = Prefecture.all
    @user = User.find(current_user.id)
    @address = Address.find(@user.address.id)
  end

  def update
    @address = Address.find(current_user.address.id)
    if @address.update(address_params)
      redirect_to user_path(current_user)
    else
      render action: edit
    end
  end

  private
  def address_params
    params.require(:address).permit(:zip_code, :prefecture, :city, :street, :building).merge(user_id: current_user.id)
  end
end
