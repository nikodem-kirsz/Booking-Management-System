Rails.application.routes.draw do
  resources :platnoscs
  resources :klients
  resources :apartaments
  root :to => 'reservations#index'
  post '/', to: "reservations#index"
  resources :reservations do
    member do
      get 'faktura', to: "reservations#invoice"
    end
  end
  resources :searches
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'loadKlients', to: "reservations#loadKlients"
end
