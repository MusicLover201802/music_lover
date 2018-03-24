class Lovers::GenresController < ApplicationController
  def show
  	@genre   = Genre.find(params[:id])
  	@item    = Item.where(id: @genre)
  	@items   = Item.all

  	### 検索用 ###
    @search  = Item.ransack(params[:q])
    @selects = @search.result.page(params[:page])
  end
end
