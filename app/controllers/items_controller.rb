class ItemsController < ApplicationController
  def index
    @items = Item.all.order("created_id: :DESC")
  end
end
