Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"

    get "/help", to: "static_pages#help"
    get "/about", to: "static_pages#about"
    get "/contact", to: "static_pages#contact"
    get "/signup", to: "users#new"
    get "/signin", to: "session#new"
    post "/signin", to: "session#create"
    delete "/logout", to: "session#destroy"
    resources :users, except: %i(destroy index)
    resources :movies, only: %i(show create)

    namespace :admin do
      get "/movie", to: "movies#new"
      get "/movies", to: "movies#index"
      resources :movies , only: %i(create show)
    end
  end
end
