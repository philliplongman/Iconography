Rails.application.routes.draw do

  devise_for :users

  root "homes#index"

  resources :campaigns, only: %i[new create edit update] do
    resource :graph, only: %i[show]
    resources :icons, only: %i[index show]
  end

end
