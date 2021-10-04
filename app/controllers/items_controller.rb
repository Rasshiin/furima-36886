class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_prototype, only: [:edit, :update, :show]
  before_action :move_to_index, only: [:edit, :update]

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

  def show
  end

  def edit
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:title, :image, :price, :explanation, :category_id, :items_condition_id, :postage_load_id, :prefecture_id, :shipment_day_id,).merge(user_id: current_user.id)
  end

  def set_prototype
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
  end
end
