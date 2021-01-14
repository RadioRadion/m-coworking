require 'rails_helper'

RSpec.describe User, type: :model do

  subject {
    described_class.new(email: "vito@gromail.com",
                        password: "azerty",
                        first_name: "Patrick",
                        last_name: "Fiori",
                        biography: "Ainsi voici ma vie",
                        phone_number: "0555304214",
                        confirmed_at: Time.now)
  }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    it "is not valid without a email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end
    it "is not valid if biography > 300 caracters" do
      subject.biography = "Notas Scipionem est difficile quasi enim adhibere oves amicis amicitias iudicarent haberet
      amicitia) sane et tollitque parandis eligendis qui est qui amicitias enim eligendis igitur ipsa Scipionem iudicare
      in experiendi erat experiendi nec in et amicos igitur amicitia) de omnibus quasi haberet quibus et Scipionem
      diligentiores dicere ad ad quibus essent quisque amicis haberet haberet iudicium in."
      expect(subject).to_not be_valid
    end
  end
end
