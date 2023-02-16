class RegistrationsController < Devise::RegistrationsController
  before_action :check_admin_number, only: [:new]

  private

  def account_update_params
    params.require(:admin).permit(:profile_picture, :about, :email, :password, :password_confirmation,
                                  :current_password)
  end

  def check_admin_number
    admin_number = Admin.all.count
    return unless admin_number > 0

    redirect_to new_admin_session_path
  end
end
