Rails.application.routes.draw do
  root 'status#index'

  get ':slug', to: 'api/v1/links#show'

  namespace :api do
    namespace :v1 do
      resources :short_links
    end
  end
end
