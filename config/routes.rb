Rails.application.routes.draw do

# 名前空間lovers
  namespace :lovers do
    devise_for :users, controllers: {
      sessions: 'lovers/users/sessions',
      registrations: 'lovers/users/registrations',
      passwords: 'lovers/users/passwords'
    }

    root 'root#top'

    resources :users, only: [:show, :edit, :update]
    get '/users/:id/retire', to: 'users#retire'

    resources :user_items, only: [:show, :create, :destroy, :update]

    get '/end', to: 'end#end'

    resources :destinations, only: [:new, :create, :destroy]

    get '/orders/new', to: 'orders#new'
    get '/orders/:id', to: 'orders#show'

    get '/items/', to: 'items#index'
    get '/items/:id', to: 'items#show'

    get '/genres/:id', to: 'genres#show'

  end


# 名前空間admin
  namespace :admin do
    get '/top', to: 'root#top'

    resources :users, only: [:index, :show, :edit, :update]
    get '/users/:id/retire', to: 'users#retire'

    resources :items

    resources :orders, only: [:index, :show, :edit, :create, :update]

    resources :genres, only: [:index, :create, :update, :destroy]
  end

# adminコントローラ・devise用コントローラのみ、URLを/admin/admins/...から/admin/...とするための設定
  scope module: 'admin' do
    devise_for :admins,controllers:{
      sessions: 'admin/admins/sessions',
      registrations: 'admin/admins/registrations',
      passwords: 'admin/admins/passwords'
    }
    resources :admins, only: [:show, :edit, :update]
  end


end
