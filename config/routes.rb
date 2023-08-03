Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  root to: redirect('/api-docs')

  namespace :api do
    namespace :v1 do

      resources :posts, only: %i[ index create ] do
        resources :comments, only: %i[ index create ] do
          resources :replies, only: %i[ index create ]
        end
      end

      resources :comments, except: %i[create index]
      resources :posts
      resources :replies, except: %i[create index]
     
      get 'posts/:id/like', to: 'posts#like'
      get 'comments/:id/like', to: 'comments#like'
      get 'replies/:id/like', to: 'replies#like'

      devise_for :users
      post 'users/sign_up', to: 'users#sign_up'
    end
  end
end