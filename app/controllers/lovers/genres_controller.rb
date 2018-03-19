class Lovers::GenresController < ApplicationController
  def show
  	# @items = Item.where("item_name like ?", "artist_name like ?").search(params[:search])
  	@genre = Genre.find(params[:id])
  	@item  = Item.where(id: @genre)
  	@items = Item.all
  end
end
