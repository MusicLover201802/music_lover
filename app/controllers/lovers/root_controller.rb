class Lovers::RootController < ApplicationController
  def top
  	@items = Item.all
  end
end
