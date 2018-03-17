class Lovers::UserItemsController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@user_items = @user.user_items
  end

  def create
  end

  def destroy
  end

  def update
  end

end
