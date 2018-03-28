class Admin::AdminsController < ApplicationController

      before_action :authenticate_admin!

  def show
  	# @admin = Admin.find(params[:id])
  	# @admin == current_admin
  end

  def edit
  end

  def update
  end

end
