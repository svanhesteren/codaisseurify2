Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'artists#index'
  resources :artists do
    resources :songs
  end
  resources :songs
  resources :photos
  get 'gol', to: 'gol#index'
end
