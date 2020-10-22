Rails.application.routes.draw do
  devise_for :users
  resources :contacts
  get '/search' => 'contacts#search', :as => 'search_contacts'
  get 'view/device/view' => 'devise/sessions#view', :as => 'view_user'

  #get 'contacts/search', to: "contacts#search"
  #get 'contacts/index'
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'contacts#index'

end
