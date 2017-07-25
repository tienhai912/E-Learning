require "rails_helper"

RSpec.describe Answer, type: :model do
  let!(:category) {FactoryGirl.create :category}
  let!(:course) {FactoryGirl.create :course}
  let!(:lesson) {FactoryGirl.create :lesson}
  let!(:word) {FactoryGirl.create :word}
  let!(:answer) {FactoryGirl.create :answer}

  it "is valid with valid attributes" do
    expect(answer).to be_valid
  end

  it "is not valid without word_id" do
    answer.word_id = nil
    expect(answer).to_not be_valid
  end

  it "is not valid with a non-integer word_id" do
    answer.word_id = 1.2
    expect(answer).to_not be_valid
    answer.word_id = "a"
    expect(answer).to_not be_valid
  end

  it "is not valid without content" do
    answer.content = "   "
    expect(answer).to_not be_valid
  end
  it "is not valid without is_correct" do
    answer.is_correct = nil
    expect(answer).to_not be_valid
  end

  it "is not valid with a long content" do
    answer.content = "a" * 251
    expect(answer).to_not be_valid
  end
end
