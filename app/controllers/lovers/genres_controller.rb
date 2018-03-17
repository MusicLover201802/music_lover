class Lovers::GenresController < ApplicationController
  def show
  	@items = Item.where("item_name like ?", "artist_name like ?").search(params[:search])
  end
end
