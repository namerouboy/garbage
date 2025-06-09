class SessionsController < ApplicationController
  def new
  end

  def create
    auth = request.env['omniauth.auth']
    user = User.find_or_create_by(line_user_id: auth['uid']) do |u|
      u.name = auth['info']['name'] || 'LINEユーザー'
    end
    session[:user_id] = user.id
    redirect_to settings_path, notice: 'ログインしました'
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'ログアウトしました'
  end
end
