class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_one :request

  validates :biography, length: { maximum: 300 }
  validates :phone_number, format: { with: /\A(?:\+?(\d{1,3}))?([-. (]*(\d{3})[-. )]*)?((\d{3})[-. ]*(\d{2,4})(?:[-.x ]*(\d+))?)\z/,
                                    message: "veuillez entrer un numéro de téléphone valide" }

  def rank
    waiting_list = Request.where(statut: "confirmed").map(&:user_id)
    waiting_list.include?(self.id) ? waiting_list.find_index {|user| user == self.id}.to_i + 1 : "Cet utilisateur 'n'est pas sur la liste d'attente"
  end


end
