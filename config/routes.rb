Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  scope :dashboard do
    get '/', to: 'dashboard#index', as: :dashboard
  end
end
