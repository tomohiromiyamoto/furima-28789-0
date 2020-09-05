class DealsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @item = Item.find(params[:item_id])
    if @item.deal.present?
      redirect_to root_path
    elsif user_signed_in?
      redirect_to root_path unless current_user.id != @item.user_id
    else
      redirect_to root_path
    end
    @deal = PaymentForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @deal = PaymentForm.new(deal_params)
    if @deal.valid?
      pay_item
      @deal.save
      return redirect_to root_path
    end
    render :index
  end

  private

  def deal_params
    params.permit(
      :item_id, :deal_id, :token,
      :postal_code, :prefecture_id, :city,
      :address, :building, :phone_number
    ).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: deal_params[:token],
      currency: 'jpy'
    )
  end
end
