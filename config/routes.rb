Rails.application.routes.draw do
  root 'pages#home'

  get '/create-otp', to: 'pages#create_otp', as: 'create_otp'
  post '/create-otp', to: 'otps#create'
  
  get '/account/:id', to: 'accounts#show', as: 'account'

  get '/verify-otp', to: 'pages#verify_otp', as: 'verify_otp'
  post '/verify-otp', to: 'accounts#verify'

  get '/success', to: 'pages#success', as: 'success'
  get '/failure', to: 'pages#failure', as: 'failure'
end
