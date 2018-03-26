class Lovers::GenresController < ApplicationController
  def show
  	@i_genre = Item.where(:genre_id => params[:id])
  	@genre = Genre.find(params[:id])
  	@genres  = Genre.all
  	@item    = Item.where(id: @i_genre)
  	@items   = Item.all

  	### 検索用 ###
    @search  = Item.ransack(params[:q])
    @selects = @search.result.page(params[:page])
  end
end
