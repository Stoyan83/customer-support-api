Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: '/auth', controllers: {
    sessions: 'devise_token/sessions',
    registrations: 'devise_token/registrations'
  }

  namespace :api do
    namespace :v1 do
      resources :tickets, only: [:index]
    end
  end
end
