class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    # 今までのnewアクションに該当する処理を記述
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @item = Item.find(params[:item_id])
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
    Payjp.api_key = "sk_test_9da7489b85c0d02ad7d91bf3"
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
