Rails.application.routes.draw do

  mount LetterOpenerWeb::Engine, at: "/letter_opener"

  root to: 'users#new'

  resources :contacts

  resources :users, only: [:new, :create, :show]

  resources :sessions, only: [:new, :create, :destroy]

  resources :favorites, only: [:create, :destroy]

  resources :blogs do
    resources :comments
    collection do#collection doはidなどを必要としない固有のルーティングを生成する
      post :confirm
    end
  end

  resources :feeds do
    collection do
      post :confirm
    end
  end

end
