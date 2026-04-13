class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      forwarding_url = session[:forwarding_url]
      reset_session      # ログインの直前に必ずこれを書くこと
      session[:forwarding_url] = forwarding_url if forwarding_url
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      log_in user
      redirect_back_or user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url, status: :see_other
  end
end
