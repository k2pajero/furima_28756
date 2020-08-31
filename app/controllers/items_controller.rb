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
    Items.create(item_params)
  end

  private

  def item_params 
    params.require(:item).permit(:image, :text).merge(user_id: current_user.id)
  end


  def move_to_index
    unless user_signed_in?
      # リダイレクト先はnewの方が良いか？newアクション指定後に検討
      redirect_to action: :index
    end
  end
end
