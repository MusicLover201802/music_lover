class Lovers::ItemsController < ApplicationController
  def index
  	@items     = Item.all
    @item      = Item.page(params[:page]).reverse_order
    @genres    = Genre.order('genre_name DESC').reverse_order
    @genre     = Item.where(:genre_id => params[:id])

  	### 検索用 ###
    @search    = Item.ransack(params[:q])
    @selects   = @search.result.where(:purchase_flag => false).page(params[:page]).reverse_order
  end

  def show
  	@item      = Item.find(params[:id])
  	@items     = Item.all
  	@genres    = Genre.order('genre_name DESC').reverse_order
    @new_order = UserItem.new(:item_id => params[:id])
  end

end
