class ItemsController < ApplicationController
  def index
    @items = Items.all.order(created_at DESC)
  end
end
