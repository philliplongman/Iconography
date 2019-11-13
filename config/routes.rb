Rails.application.routes.draw do

  devise_for :users

  root "homes#index"

  resources :campaigns, except: %i[index destroy] do
    resource :graph, only: %i[show]
    resources :icons, except: %i[destroy]
  end

end
