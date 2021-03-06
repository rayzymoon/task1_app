Rails.application.routes.draw do
  get 'articles/new'
  get 'articles/create'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  get 'home/top'
  # get 'users/dash_boards'

  devise_scope :user do
    root "users/sessions#new"

    put 'confirmation', to: 'users/confirmations#show', as: :back_confirmation
  end

  devise_for :users,
  controllers: {
      confirmations: 'users/confirmations',
      dashboards: 'users/dash_boards',
    }

  namespace :users do
    resources :dash_boards, only: [:index]
    resources :articles
  end

  
end