Rails.application.routes.draw do

  get 'say/thank_you'
  get 'say/good_bye'
  get 'say/welcome' => 'say#welcome', as: :welcome
  resources :say

  get 'admin' => 'admin#index'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  #get 'sessions/new'
  get "sessions/create"
  get "sessions/destroy"
  resources :users

  resources :orders

  #get 'line_items/index' => 'line_items#index', as: :line_items
  resources :line_items

  resources :carts

  #get 'store/index' => 'store#index', as: :store
  get 'store' => 'store#index', as: :store
  #resources :sausages
  #get "store/index"
  resources :sausages do
    get :who_bought, on: :member
  end

  #get '*path', to: 'store#index'
  root 'say#welcome'
  get '*path' => redirect('/')


end
