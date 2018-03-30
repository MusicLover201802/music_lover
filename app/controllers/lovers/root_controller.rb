class Lovers::RootController < ApplicationController
  def top
  	@items  = Item.all
  	@genres = Genre.order('genre_name DESC').reverse_order

  	### 検索用 ###
    @search    = Item.ransack(params[:q])
    @selects   = @search.result.page(params[:page])
  end
end
