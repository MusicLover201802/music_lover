class Lovers::UsersController < ApplicationController
  def show
  	@orders = Order.find(current_user.id)
  	@items = Item.find(id = 1)
  end

  def edit
  end

  def retire
  end

  def update
  end


end
