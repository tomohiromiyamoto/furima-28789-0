class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_item, only: %i[show destroy edit update]

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

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def show; end

  def edit
    render :show unless @item.user_id == current_user.id
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
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
            images: []
          )
          .merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
