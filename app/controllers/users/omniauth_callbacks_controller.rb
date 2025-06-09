# app/controllers/users/omniauth_callbacks_controller.rb

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def line
    Rails.logger.info "=== LINE callback received ==="
    auth = request.env['omniauth.auth']
    Rails.logger.info "Auth info: #{auth.inspect}"

    @user = User.find_or_create_by(provider: auth.provider, uid: auth.uid) do |u|
      u.email = auth.info.email || "#{auth.uid}@example.com"
      u.password = Devise.friendly_token[0, 20]
      u.name = auth.info.name
    end

    if @user.persisted?
      Rails.logger.info "User persisted, signing in: #{@user.inspect}"
      sign_in_and_redirect @user
    else
      Rails.logger.info "User not persisted, redirecting to sign up"
      redirect_to new_user_registration_url
    end
  end

  def after_omniauth_failure_path_for(scope)
    Rails.logger.info "Omniauth failure"
    root_path # 失敗時はトップに戻す
  end
end
