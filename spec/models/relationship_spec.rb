require "rails_helper"

RSpec.describe Relationship, type: :model do
  let!(:user) {FactoryGirl.create :user}
  let!(:user2) {FactoryGirl.create :user2}
  let!(:relationship) {FactoryGirl.create :relationship}

  it "is valid with valid attributes" do
    expect(relationship).to be_valid
  end

  it "is not valid without a follower_id" do
    relationship.follower_id = nil
    expect(relationship).to_not be_valid
  end

  it "is not valid without a following_id" do
    relationship.following_id = nil
    expect(relationship).to_not be_valid
  end

  it "is not valid with a non-integer follower_id" do
    relationship.follower_id = 1.2
    expect(relationship).to_not be_valid
    relationship.follower_id = "a"
    expect(relationship).to_not be_valid
  end

  it "is not valid with a non-integer following_id" do
    relationship.following_id = 1.2
    expect(relationship).to_not be_valid
    relationship.following_id = "a"
    expect(relationship).to_not be_valid
  end

  it "is not valid to follow self" do
    relationship.following_id = relationship.follower_id = 1
    expect(relationship).to_not be_valid
  end
end
