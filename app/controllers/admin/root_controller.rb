class Admin::RootController < ApplicationController

      before_action :authenticate_admin!

  def top
  end
end
