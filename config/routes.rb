Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'home#dashboard'
  resources :general_settings
  
  resources :home do
  	collection do 
  	get :dashboard
  	end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
