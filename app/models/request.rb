class Request < ApplicationRecord
  belongs_to :user

  validates :statut, inclusion: {in: ["confirmed", "accepted", "expired"]}
end
