Rails.application.routes.draw do

    # ユーザー側devise関連の設定(:path => "名前空間名")
    devise_for :users, :path => "lovers/users" ,controllers: {
      sessions: 'lovers/users/sessions',
      registrations: 'lovers/users/registrations',
      passwords: 'lovers/users/passwords'
    }

    # ユーザー側ページへ名前空間設定：lovers
    namespace :lovers do
      root 'root#top'

      get '/user_items/cart_stock', to: 'user_items#cart_stock'
      # get '/user_items/orderitems_save', to: 'user_items#orderitems_save'
      get '/user_items/cart_destroy', to: 'user_items#cart_destroy'

      resources :user_items, only: [:show, :create, :destroy, :update]

      get '/end', to: 'end#end'

      resources :destinations, only: [:new, :create, :destroy]

      get '/orders/orderitems_save', to: 'orders#orderitems_save'
      get '/orders/default_dest', to: 'orders#default_dest'
      resources :orders, only: [:new, :show, :create]

      get '/items/', to: 'items#index'
      get '/items/:id', to: 'items#show'

      ###　genreのパスがitemのshowと被っていた為as以降を付け足しました ###
      get '/genres/:id', to: 'genres#show', as: 'genres'

      resources :users, only: [:show, :edit, :update]

      ### 論理削除の為に追記しました ###
      get '/retire', to: 'end#retire', as: 'retire'
      patch '/users/:id/retire', to: 'users#retire', as: 'user_retire'

      ### sign_upでエラーを起こして更新すると発生するルーティングエラー回避の為、以下を追記 ###
      get '/users', to: redirect("lovers/users/sign_up")
    end


    # 管理者側ページへ名前空間設定：admin
    namespace :admin do
      get '/top', to: 'root#top'

      resources :users, only: [:index, :show, :edit, :update]
      patch '/users/:id/retire', to: 'users#retire'

      resources :items

      resources :orders, only: [:index, :show, :edit, :create, :update]
      delete '/orders/:id', to: 'orders#destroy'

      resources :genres, only: [:index, :create, :update, :destroy]
    end


    # 管理者側devise関連の設定(:path => "名前空間名")
    devise_for :admins, :path => "admins", controllers:{
      sessions: 'admin/admins/sessions',
      registrations: 'admin/admins/registrations',
      passwords: 'admin/admins/passwords'
    }

    # adminコントローラのみURLを/admin/admins/...から/admin/...とするための設定
    scope module: 'admin' do
      resources :admins, only: [:show, :edit, :update]
    end


  get '/admins/:id', to: 'admin/admins#show', as: 'show_admin'

end
