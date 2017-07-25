require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) {FactoryGirl.create :user}

  it "is valid with valid attributes" do
    expect(user).to be_valid
  end

  it "is not valid without a name" do
    user.name = "   "
    expect(user).to_not be_valid
  end

  it "is not valid without an email" do
    user.email = "   "
    expect(user).to_not be_valid
  end

  it "is not valid with a long name" do
    user.name = "a" * 51
    expect(user).to_not be_valid
  end

  it "is not valid with a long email" do
    user.email = "a" * 244 + "example.com"
    expect(user).to_not be_valid
  end

  it "is valid with valid email" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
      first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      user.email = valid_address
      expect(user).to be_valid, "#{valid_address.inspect} should be valid"
    end
  end

  it "is not valid with invalid email" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
      foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      user.email = invalid_address
      expect(user).to_not be_valid, "#{invalid_address.inspect} should be invalid"
    end
  end

  it "is not valid with duplicate email" do
    duplicate_user = user.dup
    duplicate_user.email = user.email.upcase
    user.save
    expect(duplicate_user).to_not be_valid
  end

  it "is not valid without a password" do
    user.password = user.password_confirmation = " " * 6
    expect(user).to_not be_valid
  end

  it "password should have a minimum length" do
    user.password = user.password_confirmation = "a" * 5
    expect(user).to_not be_valid
  end
end
