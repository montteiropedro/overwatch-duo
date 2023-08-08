Rails.application.routes.draw do
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      resources :ads, only: %i[index show create]
    end
  end
end
