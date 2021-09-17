Rails.application.routes.draw do
  root 'users/link_managements#index'

  resources :links, controller: 'users/link_managements', as: :links

  devise_for :users, path: 'auth', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'sign-up'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
