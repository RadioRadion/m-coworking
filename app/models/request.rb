class Request < ApplicationRecord
  belongs_to :user

  validates :statut, inclusion: {in: ["confirmed", "accepted", "expired"]}

  def self.accept!(request)
    request.statut = 'accepted'
    request.save!
  end

  def self.unconfirmed
    Request.where(statut: nil)
  end

  def self.confirmed
    Request.where(statut: "confirmed")
  end

  def self.accepted
    Request.where(statut: "accepted")
  end

  def self.expired
    Request.where(statut: "expired")
  end
end
