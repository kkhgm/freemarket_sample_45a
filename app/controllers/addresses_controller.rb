class AddressesController < ApplicationController
  layout "users"

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

  private
  def address_params
    params.require(:address).permit(:zip_code, :prefecture, :city, :street, :building).merge(user_id: current_user.id)
  end
end
