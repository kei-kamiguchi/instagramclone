Rails.application.routes.draw do
  root to: 'posts#new'
  resources :posts do
    collection do
      post 'confirm'
    end
  end
  resources :users
end
