Rails.application.routes.draw do
  root :to => 'reservations#index'
  resources :reservations do
    member do
      get 'faktura', to: "reservations#invoice"
    end
  end
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
