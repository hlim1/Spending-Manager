Rails.application.routes.draw do
  resources :exchange_rates
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "mains#index"

  resources :summaries
  resources :exchange_rates

  resources :accounts do
    resources :breakdowns, shallow: true
  end

  devise_for :users

end
