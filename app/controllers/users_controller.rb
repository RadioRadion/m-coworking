class UsersController < ApplicationController

  def update
    @user = current_user
    @user.update!(user_params)
    create_request(@user)
  end

  private

  def user_params
    params.require(:user).permit(:phone_number, :biography)
  end

  def create_request(user)
    if user.request
      redirect_to user_path(user), notice: "Infos changed"
    else
      Request.create!(statut: "confirmed", user: user)
    end
  end
end
