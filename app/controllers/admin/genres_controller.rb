class Admin::GenresController < ApplicationController
  def index
  	@genres = Genre.page(params[:page]).per(5)
  	@genre = Genre.new
  end

  def create
    @genre = Genre.new(post_params)
    @genre.save
    redirect_to admin_genres_path
  end

  def update
  	genre = Genre.find(params[:id])
    genre.update(post_params)
    redirect_to admin_genres_path
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to admin_genres_path
  end

  private
  def post_params
  	params.require(:genre).permit(:genre_name)
  end

end
