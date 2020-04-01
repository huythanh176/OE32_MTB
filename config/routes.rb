Rails.application.routes.draw do
  devise_for :users,
              path: '',
              path_names: {sign_in: 'login' ,sign_out: 'logout' ,edit: 'profile',sign_up: 'resgistration'},
              controllers: {omniauth_callbacks: 'omniauth_callbacks' }
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"

    get "/help", to: "static_pages#help"
    get "/about", to: "static_pages#about"
    get "/contact", to: "static_pages#contact"
    get "/signup", to: "users#new"

    resources :users, only: :show
    resources :movies, except: %i(edit index new)
    resources :theaters, only: %i(show index)
    resources :bookings, only: %i(new create)
    resources :seats, only: %i(create destroy new)
    resources :booking_details, only: :index
    resources :schedules, only: %i(index create update)
    resources :movies, except: %i(edit index new) do
      resources :comments, only: %i(create destroy)
    end

    namespace :admin do
      resources :movies, only: %i(edit new index)
      resources :users, only: %i(index destroy)
      resources :schedules, only: %i(index new edit)
      resources :booking_details, only: :index
    end
  end
end
