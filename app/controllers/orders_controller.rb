class OrdersController < ApplicationController
  # before_action :move_to_index, except: :index
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderDelivery.new(:user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building_name, :tell, :token 
      order_params(:user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building_name, :tell, :token))

    if @order.valid?
      pay_item 
      @order.save
      return redirect_to root_path
    else
      # 'new'?
      render 'index'
    end
  end

  private
  
  # 保存先はdeliveryテーブルだがここで合ってる？
  def order_params
    params.require(:order_delivery).permit(:user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building_name, :tell, :token)
  end

  def pay_item
    Payjp.api_key = "sk_test_edced86049b529e0c33694ef"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  # まだ作動できない
  # def move_to_index
  #   # redirect_to root_path unless current_user.id != @item.user_id
  # end
end
