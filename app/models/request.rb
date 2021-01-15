class Request < ApplicationRecord
  belongs_to :user

  validates :statut, inclusion: {in: ["confirmed", "accepted", "expired"]}
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :biography, presence: true
  validates :phone_number, presence: true, format: { with: /(?:(?:\+|00)33|0)\s*[1-9](?:[\s.-]*\d{2}){4}/mi,
                                    message: "veuillez entrer un numéro de téléphone valide" }

  scope :unconfirmed, -> { where(statut: nil) }
  scope :confirmed, -> { where(statut: "confirmed") }
  scope :accepted, -> { where(statut: "accepted") }
  scope :expired, -> { where(statut: "expired") }

  def self.accept!(request)
    request.statut = 'accepted'
    request.save!
  end

end
