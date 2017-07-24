require "rails_helper"

RSpec.describe Test, type: :model do
  let!(:category) {FactoryGirl.create :category}
  let!(:course) {FactoryGirl.create :course}
  let!(:lesson) {FactoryGirl.create :lesson}
  let!(:user) {FactoryGirl.create :user}
  let!(:test) {FactoryGirl.create :test}

  it "is valid with valid attributes" do
    expect(test).to be_valid
  end

  it "is not valid without user_id" do
    test.user_id = nil
    expect(test).to_not be_valid
  end

  it "is not valid with a non-integer user_id" do
    test.user_id = 1.2
    expect(test).to_not be_valid
    test.user_id = "a"
    expect(test).to_not be_valid
  end

  it "is not valid without lesson_id" do
    test.lesson_id = nil
    expect(test).to_not be_valid
  end

  it "is not valid with a non-integer lesson_id" do
    test.lesson_id = 1.2
    expect(test).to_not be_valid
    test.lesson_id = "a"
    expect(test).to_not be_valid
  end

  it "is not valid without created_at" do
    test.created_at = nil
    expect(test).to_not be_valid
  end
end
