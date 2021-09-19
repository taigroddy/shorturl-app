Rails.application.routes.draw do
  default_url_options host: ENV.fetch('HOST') { 'localhost' }, port: ENV.fetch('PORT') { '3000' }

  root 'users/link_managements#index'

  resources :links, controller: 'users/link_managements', as: :links

  namespace :api do
    namespace :users do
      resources :links, only: [:index], controller: 'link_managements',
                        as: :links,
                        defaults: { format: :json },
                        constraints: ->(request) { %w[application/json].include?(request.headers['Content-Type']) } do
        collection do
          post '/generate-short-url', action: :generate_short_url, as: :generate_short_url
        end
      end
    end
  end

  devise_for :users, path: 'auth', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'sign-up'
  }

  get '/:short_path', to: 'users/link_managements#redirect',
                      as: :redirect_original,
                      constraints: ->(request) { request.params[:short_path].length >= NUM_OF_SHORT_URL_CHAR }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
