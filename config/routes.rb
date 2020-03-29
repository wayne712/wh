Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :center do
    resources :sessions, only: [:create, :new] do
      delete :destroy, on: :collection
    end
    resources :users
    resources :items
  end
end
