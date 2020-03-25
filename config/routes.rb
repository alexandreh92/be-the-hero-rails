# frozen_string_literal: true

Rails.application.routes.draw do
  scope :api do
    resources :accredited_networks, on: :collection do
      get :search, on: :collection
      get :benefits
    end
    resources :filters, on: :collection

    devise_for :users,
               path: '',
               path_names: {
                 sign_in: 'sessions',
                 sign_out: 'logout'
               },
               controllers: {
                 sessions: 'sessions',
                 registrations: 'registrations'
               }

    namespace :backoffice do
      resources :accredited_networks, on: :collection
      resources :customers, on: :collection
      resources :companies, on: :collection
      resources :plans, on: :collection
    end
  end

  # Fallback Routes to React
  get '*path', to: 'application#fallback_index_html', constraints: lambda { |request|
    !request.xhr? && request.format.html?
  }
end
