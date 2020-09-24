Rails.application.routes.draw do
  devise_for :users
  resources :contacts
  #get 'contacts/index'
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'contacts#index'

end
