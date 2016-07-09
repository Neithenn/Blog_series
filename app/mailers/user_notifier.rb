class UserNotifier < ApplicationMailer

	default :from => 'juegodeteorias@gmail.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Muchas gracias por haberte registrado a Juego de Teorías!' )
  end

  def send_notification_new_user(user)
  	@user = user
  	mail( :to => 'juegodeteorias@gmail.com',
  		:subject => 'Nuevo usuario creado')
  end

   def send_notification_confirmation(user, post)
  	@user = user
  	@post = post
  	mail( :to => @user.email,
  		:subject => "Felicitaciones #{@user.username} !")
  end

  def send_notification_rejected(user, post)
  	@user = user
  	@post = post
  	mail( :to => @user.email,
  		:subject => "Felicitaciones #{@user.username} !")
  
  end

end
