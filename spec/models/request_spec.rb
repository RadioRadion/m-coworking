require 'rails_helper'

user = User.new(email: "vito@gromail.com", password: "azertie", first_name: "Vito",
  last_name: "Fiori", biography: "Voici ma vie", phone_number: "0632469163")

RSpec.describe Request, type: :model do

  subject {
    described_class.new(user: user,
                        statut: "confirmed")
  }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    it "is valid with statut confirmed" do
      subject.statut = "confirmed"
      expect(subject).to be_valid
    end
    it "is valid with statut accepted" do
      subject.statut = "accepted"
      expect(subject).to be_valid
    end
    it "is valid with statut expired" do
      subject.statut = "expired"
      expect(subject).to be_valid
    end
    it "is not valid without a statut" do
      subject.statut = nil
      expect(subject).to_not be_valid
    end
    it "is not valid with a wrong statut" do
      subject.statut = "parti en Egypte"
      expect(subject).to_not be_valid
    end
    it "is not valid without a user" do
      subject.user = nil
      expect(subject).to_not be_valid
    end
    it "has one request after adding one" do
      user.skip_confirmation!
      subject.save
      expect(Request.count).to eq 1
    end


  end
end
