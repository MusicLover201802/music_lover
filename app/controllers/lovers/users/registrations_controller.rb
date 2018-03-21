# # frozen_string_literal: true

class Lovers::Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_account_update_params, only: [:update]
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  def edit
    super
    @user = current_admin
  end

  # PUT /resource
  # def update
  # binding.pry
  # super
  # user = User.find(current_user.id)
  # user.update(user_params)
  # end


  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end


   protected
  ### アカウント編集後のリダイレクト ###
  def after_update_path_for(resource)
    lovers_user_path(resource)
  end

  ### サインアップ後のリダイレクト ###
  def after_sign_up_path_for(resource)
    super(resource)
    lovers_root_path
  end

  ### アカウント編集のパスワード無し設定 ###
  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  ### サインアップ時のカラム追加 ###
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :last_name_kana, :first_name, :first_name_kana, :postal_code, :prefecture, :city, :building, :phone_number])
  end

  ### アカウント編集のカラム追加 ###
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:last_name, :last_name_kana, :first_name, :first_name_kana, :postal_code, :prefecture, :city, :building, :phone_number])
  end

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:account_update) do |u|
  #     u.permit(:last_name, :last_name_kana, :first_name, :first_name_kana, :postal_code, :prefecture, :city, :building, :phone_number, :email, :password, :password_confirmation)
  #   end
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :last_name_kana, :first_name, :first_name_kana, :postal_code, :prefecture, :city, :building, :phone_number, :retire_flag])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

end
