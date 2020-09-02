class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item)
          .permit(
                  :name,
                  :introduction,
                  :category_id,
                  :condition,
                  :price,
                  :delivery_fee,
                  :delivery_days,
                  :prefecture_id,
                  images: [])
          .merge(user_id: current_user.id)
  end
end