class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
    before_action :configure_permitted_parameters, if: :devise_controller?
    # devise利用の機能（ユーザ登録、ログイン認証など）が使われる場合、その前にconfigure_permitted_parametersが実行されます。

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    # configure_permitted_parametersでは、devise_parameter_sanitizer.permitでnameのデータ操作を許可するアクションメソッドが指定されています。
    # 今回のケースでは、ユーザ登録（sign_up）の際に、ユーザ名（name）のデータ操作が許可されます。
  end

  def after_sign_in_path_for(resource)
    user_path(current_user.id) # ログイン後に遷移するpathを設定
  end

  def after_sign_out_path_for(resource)
    root_path # ログアウト後に遷移するpathを設定
  end

  # def ensure_correct_user
  #   @user = User.find_by(id:params[:id])
  #   if user_id != @current_user.id
  #     redirect_to("/users/show")
  #   end
  # end
end
