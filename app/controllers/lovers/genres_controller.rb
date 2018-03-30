class Lovers::GenresController < ApplicationController
  def show
  	@i_genre = Item.where(:genre_id => params[:id])
  	@genre = Genre.find(params[:id])
  	@genres  = Genre.order('genre_name DESC').reverse_order
  	item    = Item.where(id: @i_genre)
    @item = item.where(:purchase_flag => false).page(params[:page]).reverse_order
  	@items   = Item.all

  	### 検索用 ###
    @search  = Item.ransack(params[:q])
    @selects = @search.result.page(params[:page])
  end
end
