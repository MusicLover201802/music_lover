class Lovers::ItemsController < ApplicationController
  def index
  	@items = Item.all

    @search = Item.ransack(params[:q])
    @item = @search.result.page(params[:page])
  end

  def show
  	@item  = Item.find(params[:id])
  	@items = Item.all
  end

end
