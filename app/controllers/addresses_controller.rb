class AddressesController < ApplicationController
  layout "users"

  def new
    @address = Address.new
  end

  def create
    Address.create()
  end
end
