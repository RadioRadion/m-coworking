class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_one :request

  validates :biography, length: { maximum: 300 }

  def after_confirmation
    ContactMailer.contact(self).deliver_now
  end


end
