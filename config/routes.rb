Rails.application.routes.draw do
  devise_for :users, {
    controllers: {
      registrations: 'users/registrations'
    }
  }
  root to: "home#index"

  scope :dashboard do
    get '/', to: 'dashboard#index', as: :dashboard
  end
  namespace :dashboard do
    resources :tasks
  end
end
