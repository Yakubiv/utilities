Rails.application.routes.draw do
  root 'dashboards#show'

  resources :service_types, only: []
  resources :cities, only: [] do
    get :autocomplete_city_name, on: :collection
  end

  resources :houses do
    scope module: :houses do
      resources :services, except: :index
      resources :invoices
    end
  end
  resource :dashboard, only: :show
end
