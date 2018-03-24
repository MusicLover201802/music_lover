class Lovers::ItemsController < ApplicationController
  def index
  	@items     = Item.all
    @item      = Item.page(params[:page]).reverse_order

  	### 検索用 ###
    @search    = Item.ransack(params[:q])
    @selects   = @search.result.page(params[:page]).reverse_order
  end

  def show
  	@item      = Item.find(params[:id])
  	@items     = Item.all
  	@new_order = UserItem.new(:item_id => params[:id])
  end

end
