class ApplicationController < ActionController::Base
  
  #ログインしていない状態でトップページ以外のアクセスされた場合は、ログイン画面へリダイレクト
  before_action :authenticate_user!, except: [:top ,:about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(current_user.id) 
  end

  #def after_sign_out_path_for(resource)
    #root_path
  #end

  protected
  

  def configure_permitted_parameters
    #attr =[:email,:name,:password,:password_confirmation]    
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end