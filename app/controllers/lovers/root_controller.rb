class Lovers::RootController < ApplicationController
  def top
  	@items  = Item.all
  	@genres = Genre.all

  	### 検索用 ###
    @search    = Item.ransack(params[:q])
    @selects   = @search.result.page(params[:page])
  end
end
