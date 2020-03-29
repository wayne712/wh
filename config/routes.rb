Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :center do
    resources :sessions, only: [:create, :new] do
      delete :destroy, on: :collection
    end
    resources :users
    resources :items
    get :logs, to: 'logs#index'
    resources :acquires
  end

  resources :sessions, only: [:create, :new] do
    delete :destroy, on: :collection
  end
  resources :acquires, only: %i[index create new show]
  root 'acquires#index'
end
