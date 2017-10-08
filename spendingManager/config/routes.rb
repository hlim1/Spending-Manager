Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "mains#index"

  resources :summaries

  resources :accounts do
    resources :breakdowns, shallow: true
  end

  devise_for :users

end
