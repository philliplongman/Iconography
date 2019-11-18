Rails.application.routes.draw do

  devise_for :users

  root "homes#index"

  resources :campaigns, except: %i[index] do
    get :relationships, to: "campaigns#relationships"
    resource :graph, only: %i[show]

    resources :domains, only: %i[index new create edit update destroy]
    resources :icons
  end

end
