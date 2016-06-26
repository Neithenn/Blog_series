class OmniauthCallbacksController < Devise::OmniauthCallbacksController	

def all
	user = User.from_omniauth(request.env["omniauth.auth"])
		if user.persisted?
			sign_in_and_redirect user
		else
			begin
				session["devise.user_attributes"] = user.user_attributes
				 UserNotifier.send_notification_new_user(@user).deliver
				redirect_to new_user_registration_url
			rescue
				redirect_to new_user_registration_url, :flash => { :alert => 'La cuenta de email ya se encuentra registrada con otro proveedor! Prueba ingresando con Google o ingresando tus datos'}
	     
	     	end
		end

end

	def google_oauth2
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
    else
      session["devise.google_data"] = request.env["omniauth.auth"].except("extra")
      UserNotifier.send_notification_new_user(@user).deliver
      redirect_to new_user_registration_url
    end
  end

	#alias_method :google_oauth2, :all
	alias_method :facebook, :all
end
