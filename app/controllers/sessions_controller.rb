class SessionsController < ApplicationController
  protect_from_forgery except: :callback
  def callback
    auth = request.env['omniauth.auth']
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
