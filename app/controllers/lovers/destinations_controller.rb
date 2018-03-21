class Lovers::DestinationsController < ApplicationController
	def new
		@destinations = Destination.where(user_id: current_user.id)
		@new_destination = Destination.new
	end

	def create
		@new_destination = Destination.new(dest_params)
		@new_destination.user_id = current_user.id
		@new_destination.save
		redirect_to new_lovers_destination_path
	end

	def destroy
	end



	private
	def dest_params
		params.require(:destination).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :prefecture, :city, :building, :phone_number)
	end

end
