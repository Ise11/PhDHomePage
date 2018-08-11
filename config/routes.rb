Rails.application.routes.draw do
  resources :categories, only: [:index, :show]

  resources :comments
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :projects do
    put :sort, on: :collection
  end

  get 'about', to: 'pages#about'
  get 'publications', to: 'pages#publications'
  get 'teaching', to: 'pages#teaching'
  get 'contact', to: 'pages#contact'
  get 'news', to: 'pages#news'

  resources :blogs do
    member do
      get :toggle_status
    end
  end

 mount ActionCable.server => '/cable'

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
