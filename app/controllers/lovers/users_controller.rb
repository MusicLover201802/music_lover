class Lovers::UsersController < ApplicationController
  def show
  	@orders = Order.where(user_id: current_user.id)
  end

  def edit
  end

  def retire
  end

  def update
  end


end
