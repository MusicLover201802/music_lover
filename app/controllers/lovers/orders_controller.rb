class Lovers::OrdersController < ApplicationController
  def new
  end

  def show
  	@order = Order.find(params[:id])
  end
end
