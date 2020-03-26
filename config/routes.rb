# frozen_string_literal: true

Rails.application.routes.draw do
  scope :api do
    devise_for :ngos,
               skip: :registration,
               path: '',
               path_names: {
                 sign_in: 'sessions',
                 sign_out: 'logout'
               },
               controllers: {
                 sessions: 'sessions'
               }
    devise_scope :ngo do
      resource :registration, as: :user_registration, only: %i[new edit
                                                               update destroy], path: '',
                              controller: 'registrations' do
        post :registrations, action: :create, as: ''
      end
    end
  end

  # Fallback Routes to React
  get '*path', to: 'application#fallback_index_html', constraints: lambda { |request|
    !request.xhr? && request.format.html?
  }
end
