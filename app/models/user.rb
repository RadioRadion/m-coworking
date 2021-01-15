class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_one :request

  validates :biography, length: { maximum: 300 }

  def rank
    waiting_list = Request.where(statut: "confirmed").map(&:user_id)
    waiting_list.include?(self.id) ? waiting_list.find_index {|user| user == self.id}.to_i + 1 : "Cet utilisateur 'n'est pas sur la liste d'attente"
  end


end
