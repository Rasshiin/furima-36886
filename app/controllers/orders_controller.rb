class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_orders
  before_action :move_to_index

  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :municipalities, :address, :building_name, :telephone, :prefecture_id).merge(purchase_history_id: params[:purchase_history_id], user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_orders
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user.id == @item.user_id || @item.purchase_history != nil
      redirect_to root_path
    end
  end
end