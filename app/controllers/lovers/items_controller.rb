class Lovers::ItemsController < ApplicationController
  def index
  	@items = Item.all
  end

  def show
  	@item  = Item.find(params[:id])
  	genres = Item.find_by_genre_id(params[:id])
  	@genre = Genre.find_by_id(genres)
  end
end
