class Admin::GenresController < ApplicationController
  def index
  	@genres = Genre.page(params[:page]).per(5)
  	@genre = Genre.new
  end

  def create
    @genre = Genre.new(post_params)
    @genre.save
    redirect_to admin_genres_path, notice: "ジャンル登録が完了しました"
  end

  def update
  	genre = Genre.find(params[:id])
    genre.update(post_params)
    redirect_to admin_genres_path, notice: "ジャンル編集が完了しました"
  end

  def destroy
    # @genre = Genre.find(params[:id])
    # @genre.destroy
    # redirect_to admin_genres_path
  end

  # def retire
  # genre = Genre.find(params[:id])
  # genre.update(retire_flag: true) ### リタイアフラグをtrueに更新
  # genre.soft_destroy ### 論理削除処理※soft_destroyはkakurenbo-putiの固有メソッド
  # session.destroy ### 退会したらログアウトさせる
  # redirect_to lovers_retire_path ### 言わずもがな遷移先
  # end

  private
  def post_params
  	params.require(:genre).permit(:genre_name)
  end

end
