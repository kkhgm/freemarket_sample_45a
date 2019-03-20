# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]
  def facebook
    callback_for(:facebook)
  end

  def google_oauth2
    callback_for(:google)
  end
  # You should also create an action method in this controller like this:
  # def twitter
  # end
  private
  def callback_for(provider)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.last_name == nil
      session[:id] = @user.id
      bypass_sign_in(@user)
      redirect_to new_user_registration_sns_path
    else
      sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    end
  end

  # def failure
  #   redirect_to root_path
  # end
  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
