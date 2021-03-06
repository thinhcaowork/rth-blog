Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :sessions, only: %i[new create destroy]
  resource :registrations, only: %i[new create]
  resources :blog_posts, only: %i[index show new create] do
    scope module: :blog_posts do
      resources :comments, only: %i[create destroy]
    end
  end
  scope module: :v0, path: :v0 do
    resources :blog_posts
  end

  post '/auth/login', to: 'v0/api_authentication#login'
  root to: 'blog_posts#index'
end
