Rails.application.routes.draw do
  get 'posts/index'
  get '/', to: 'posts#index'
  resource :posts
  resource :comments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
