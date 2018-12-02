Rails.application.routes.draw do
  root 'dashboards#show'

  resources :service_types

  resources :houses, except: :index do
    scope module: :houses do
      resources :services, except: :index
      resources :invoices
    end
  end
  resource :dashboard, only: :show
end
