class ItemsController < ApplicationController
  # showアクションを指定したら、[:show]を追加する
  before_action :move_to_index, except: [:index]
  def index
    @items = Item.all.order(created_at: 'DESC')
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
    params.require(:item).permit(
      :image, :name, :content, :condition_id,
      :prefecture_id, :category_id, :delivery_fee_id, :delivery_days_id)
  end


  def move_to_index
    unless user_signed_in?
      # リダイレクト先はnewの方が良いか？newアクション指定後に検討
      redirect_to action: :index
    end
  end
end
