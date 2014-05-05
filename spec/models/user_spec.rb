require 'spec_helper'


describe User do
  let (:valid_attributes) {
    {
      first_name: "Mark",
      last_name: "Hustad",
      email: "hustada80@gmail.com",
      password: "fuckyou123",
      password_confirmation: "fuckyou123"
    }
  }
  context "validations" do
    let(:user) { User.new(valid_attributes) }


    before do
      User.create(valid_attributes)
    end


    it "requires an email" do 
      expect(user).to validate_presence_of(:email)
    end

    it "requires a unique email" do
      expect(user).to validate_uniqueness_of(:email)
    end

    it "requires a unique email (case insensitive)" do
      user.email = "HUSTADA80@GMAIL.COM"
      expect(user).to validate_uniqueness_of(:email)
    end

    it "require the email address to look like an email address" do
      user.email = "mark"
      expect(user).to_not be_valid
    end

    
  end

  describe "#downcase_email" do
    it "makes the email attribute lowercase" do
      user = User.new(valid_attributes.merge(email: "HUSTADA80@GMAIL.COM"))
      expect{ user.downcase_email }.to change{ user.email }.
      from("HUSTADA80@GMAIL.COM").
      to("hustada80@gmail.com")
    end

    it "downcases an email before saving" do
      user = User.new(valid_attributes)
      user.email = "HUSTADA80@GMAIL.COM"
      expect(user.save).to be_true
      expect(user.email).to eq("hustada80@gmail.com")
    end
  end

end