Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v1 do

      resources :posts
      resources :comments, except: %i[ index show ]
      resources :replies, except: %i[ index show ]
     
      get 'posts/:id/like', to: 'posts#like'
      get 'comments/:id/like', to: 'comments#like'
      get 'replies/:id/like', to: 'replies#like'

      namespace :auth do
        post 'login', to: 'users#login'
        post 'register', to: 'users#register'
      end
    end
  end
end