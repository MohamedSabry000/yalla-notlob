class Users::OmniauthController < Devise::OmniauthCallbacksController

 def google_oauth2
       @user = User.create_from_provider_data(request.env['omniauth.auth'])
       if @user.persisted?
            sign_in_and_redirect @user
            set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
       else
            flash[:error]='There was a problem signing you in through Google. Please register or try signing in later.'
            redirect_to new_user_registration_url
       end
    end

    def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])
if @user.persisted?
      sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"].except(:extra) # Removing extra as it can overflow some session stores
      redirect_to new_user_registration_url
    end
  end
  
    def failure
        flash[:error] = 'There was a problem signing you in. Please register or try signing in later.'
        redirect_to new_user_registration_url
    end

    
 
end