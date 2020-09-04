class OrdersController < ApplicationController
  # before_action :move_to_index, except: :index
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @order = OrderDelivery.new(order_params)
    if @order.valid?
      # pay_item APIに関するprivateメソッド
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  # 保存先はdeliveryテーブルだがここで合ってる？
  private
  def order_params
    params.require(:order_delivery).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :tell)
  end
  # まだ作動できない
  # def move_to_index
  #   # redirect_to root_path unless current_user.id != @item.user_id
  # end
end
