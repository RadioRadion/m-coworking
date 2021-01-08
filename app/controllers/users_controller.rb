class UsersController < ApplicationController

  def update
    @user = current_user
    @user.update!(user_params)
    create_request
  end

  private

  def user_params
    params.require(:user).permit(:phone_number, :biography)
  end

  def create_request
  end

end
