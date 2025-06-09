Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

#   devise_scope :user do
#   get 'users/auth/line', to: 'users/omniauth_callbacks#passthru', as: :custom_line_auth
#   get 'users/auth/line/callback', to: 'users/omniauth_callbacks#line', as: :custom_line_callback
# end

end
