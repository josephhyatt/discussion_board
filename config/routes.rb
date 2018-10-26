Rails.application.routes.draw do
  # rooting to discussions_controller.rb index action
  root 'discussions#index'

  resources :channels
  # creates path for discussions and replies 
  resources :discussions do 
    resources :replies 
  end

  devise_for :users, controllers: { registrations: 'registrations' }
end