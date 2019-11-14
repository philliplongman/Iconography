Rails.application.routes.draw do

  devise_for :users

  root "homes#index"

  resources :campaigns, except: %i[index] do
    resource :graph, only: %i[show]

    resources :domains, only: %i[index new create]
    resources :icons
  end

end
