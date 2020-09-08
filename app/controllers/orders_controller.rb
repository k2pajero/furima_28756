class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_action
  before_action :move_to_index

  def index
    @order = Order.new
  end

  def create
    @order = OrderDelivery.new(order_params)
    # binding.pry
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order).permit(
      :postal_code, :prefecture_id, :city, :address, :building_name, :tell, :token
    ).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_action
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to root_path if current_user.id == @item.user_id || !@item.order.nil?
  end
end
