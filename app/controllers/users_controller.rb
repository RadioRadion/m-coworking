class UsersController < ApplicationController

  def update
    @user = current_user
    @user.update!(user_params)
    create_request(@user)
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone_number, :biography)
  end

  def create_request(user)

    request_fields = {
      statut: "confirmed",
      user: user, email: user.email,
      biography: user.biography,
      phone_number: user.phone_number,
      first_name: user.first_name,
      last_name: user.last_name
    }

    if user.request
      if user.request.update(request_fields)
        redirect_to user_path(user), notice: "Informations modifiées"
      else
        flash.now[:alert] = 'Numéro de téléphone invalide'
        render "users/show"
      end
    else
      request = Request.new(request_fields)
      if request.save!
        redirect_to user_path(user), notice: "Nous avons bien pris en compte votre demande"
      else
        flash.now[:alert] = 'Veuillez bien remplir tous les champs'
        render "users/show"
      end
    end
  end
end
