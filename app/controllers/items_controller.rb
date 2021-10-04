class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:title, :image, :price, :explanation, :category_id, :items_condition_id, :postage_load_id, :prefecture_id, :shipment_day_id,).merge(user_id: current_user.id)
  end
end
