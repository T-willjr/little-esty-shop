class Admin::MerchantsController < ApplicationController
  def index
    @merchants = Merchant.all
  end

  def show
    @merchant = Merchant.find(params[:id])
  end

  def edit
    @merchant = Merchant.find(params[:id])
  end

  def update
    @merchant = Merchant.find(params[:id])
    @merchant.update(merchant_params)
    # flash.alert = "Information has been successfully updated"
    redirect_to "/admin/merchants/#{@merchant.id}", notice: "Information has been successfully updated"
  end

  private

  def merchant_params
    params.require(:merchant).permit(:name)
  end
end
