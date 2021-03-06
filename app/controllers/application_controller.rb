class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :my_filter, :unless => :if_user_signed_in?


  private
  def my_filter
  	if user_signed_in?
       @user_items = UserItem.where(user_id: current_user.id)
    else
    end
  end

  def if_user_signed_in?
  	self.controller_name == 'lovers'
  end
end
