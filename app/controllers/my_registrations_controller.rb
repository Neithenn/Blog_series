class MyRegistrationsController < Devise::RegistrationsController

  def create
    super
    if @user.persisted?
      UserNotifier.send_notification_new_user(@user).deliver
    end
  end

end