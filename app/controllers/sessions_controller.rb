class SessionsController < ApplicationController
  
  # GET / login
  def new
  end
  
  # POST / login
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #ユーザーログイン後にユーザー情報のページにリダイレクトする
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        message = "Accout not activated."
        message += "Check your email for the activation link"
        flash[:warning] = message
        redirect_to root_url
      end
    else
      #エラーメッセージを作成する
      flash.now[:danger] = 'Invalid email/password combination' #本当は正しくない
      render'new'
    end
  end
  
  # DELETE / logut
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
  
end
