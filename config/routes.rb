Rails.application.routes.draw do
    # resource :users, only:[:create]
    post "/register", to: "users#create"
    post "/login", to: "users#login"
    post "/book_scedule", to: "bookings#book_scedule"
    get "/auto_login", to: "users#auto_login"
    resources :scedules
    resources :bookings
end
