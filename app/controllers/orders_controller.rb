class OrdersController < ApplicationController
  before_action :move_to_index, except: :index
  def index
    @item = Item.find(params[:item_id])
  end

  def create
  end
# 保存先はdeliveryテーブルだがここで合ってる？
  private
  def order_params
    params.require(:order).permit(:postal_code, :prefecture_id, :city, :address, :tell, :building_name, :tell)
  end
# まだ作動できない
  def move_to_index
    redirect_to root_path unless current_user.id != @item.user_id
  end
end
