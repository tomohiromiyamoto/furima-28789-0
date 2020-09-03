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
  end
end
