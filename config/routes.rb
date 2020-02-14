Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :sessions, only: %i[new create destroy]
  resource :registrations, only: %i[new create]
  resources :blog_posts, only: %i[index show new create ]

  root to: 'blog_posts#index'
end
