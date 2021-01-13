class Request < ApplicationRecord
  belongs_to :user

  validates :statut, inclusion: {in: ["confirmed", "accepted", "expired"]}

  scope :unconfirmed, -> { where(statut: nil) }
  scope :confirmed, -> { where(statut: "confirmed") }
  scope :accepted, -> { where(statut: "accepted") }
  scope :expired, -> { where(statut: "expired") }

  def self.accept!(request)
    request.statut = 'accepted'
    request.save!
  end

end
