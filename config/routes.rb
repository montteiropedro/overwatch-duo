Rails.application.routes.draw do
  # root "articles#index"

  scope :auth do
    get '/discord', to: 'sessions#new'
    get '/discord/callback', to: 'sessions#create'
    delete '/discord/logout', to: 'sessions#destroy'
    get '/profile', to: 'sessions#current_user'
  end
  
  namespace :api do
    namespace :v1 do
      resources :ads, only: %i[index show create]
    end
  end
end
