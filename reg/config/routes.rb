Rails.application.routes.draw do
  root 'registrations#index'

  
  get '/sign_up', to: "registrations#new"
  post '/reg', to: "registrations#create"

  get '/sign_in', to: "sessions#new"
  post 'user/sign_in', to: "sessions#create"

  get 'sign_out', to: "sessions#destroy"

end
