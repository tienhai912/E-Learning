require "rails_helper"

RSpec.describe Result, type: :model do
  let!(:category) {FactoryGirl.create :category}
  let!(:course) {FactoryGirl.create :course}
  let!(:lesson) {FactoryGirl.create :lesson}
  let!(:word) {FactoryGirl.create :word}
  let!(:answer) {FactoryGirl.create :answer}
  let!(:user) {FactoryGirl.create :user}
  let!(:test) {FactoryGirl.create :test}
  let!(:result) {FactoryGirl.create :result}

  it "is valid with valid attributes" do
    expect(result).to be_valid
  end

  it "is not valid without test_id" do
    result.test_id = nil
    expect(result).to_not be_valid
  end

  it "is not valid with a non-integer test_id" do
    result.test_id = 1.2
    expect(result).to_not be_valid
    result.test_id = "a"
    expect(result).to_not be_valid
  end

  it "is not valid without word_id" do
    result.word_id = nil
    expect(result).to_not be_valid
  end

  it "is not valid with a non-integer word_id" do
    result.word_id = 1.2
    expect(result).to_not be_valid
    result.word_id = "a"
    expect(result).to_not be_valid
  end

  it "is not valid without answer_id" do
    result.answer_id = nil
    expect(result).to_not be_valid
  end

  it "is not valid with a non-integer answer_id" do
    result.answer_id = 1.2
    expect(result).to_not be_valid
    result.answer_id = "a"
    expect(result).to_not be_valid
  end
end
