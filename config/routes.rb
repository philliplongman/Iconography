Rails.application.routes.draw do

  devise_for :users

  root "homes#index"

  resources :campaigns, except: %i[index] do
    get :relationships, to: "campaigns#relationships"
    resource :graph, only: %i[show]
    resources :domains, except: %i[show] do
      resources :relationships, except: %i[show destroy]
    end
    resources :icons
  end

end
