class Lovers::ItemsController < ApplicationController
  def index
  end

  def show
  	@item = Item.find(params[:id])
  	genres = Item.find_by_genre_id(params[:id])
  	@genre = Genre.find_by_id(genres)
  	# disc = Disc.where(item_id: "@item")
  	# @track = Track.where(disc_id: disc)
  end
end
