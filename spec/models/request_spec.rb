require 'rails_helper'

user = User.new(email: "vito@gromail.com", password: "azertie", first_name: "Vito",
  last_name: "Fiori", biography: "Voici ma vie", phone_number: "0632469163")

RSpec.describe Request, type: :model do

  subject {
    described_class.new(statut: "confirmed",
        user: user,
        email: user.email,
        biography: user.biography,
        phone_number: user.phone_number,
        first_name: user.first_name,
        last_name: user.last_name)
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
    it "is not valid without a email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a first_name" do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a last_name" do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a biography" do
      subject.biography = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a phone_number" do
      subject.phone_number = nil
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
