require "rails_helper"

RSpec.describe Word, type: :model do
  let!(:category) {FactoryGirl.create :category}
  let!(:course) {FactoryGirl.create :course}
  let!(:lesson) {FactoryGirl.create :lesson}
  let!(:word) {FactoryGirl.create :word}

  it "is valid with valid attributes" do
    expect(word).to be_valid
  end

  it "is not valid without kind" do
    word.kind = nil
    expect(word).to_not be_valid
  end

  it "is not valid with a non-integer kind" do
    word.kind = 1.2
    expect(word).to_not be_valid
    word.kind = "a"
    expect(word).to_not be_valid
  end

  it "is not valid without lesson_id" do
    word.lesson_id = nil
    expect(word).to_not be_valid
  end

  it "is not valid with a non-integer lesson_id" do
    word.lesson_id = 1.2
    expect(word).to_not be_valid
    word.lesson_id = "a"
    expect(word).to_not be_valid
  end

  it "is not valid without content" do
    word.content = "   "
    expect(word).to_not be_valid
  end

  it "is not valid with a long content" do
    word.content = "a" * 251
    expect(word).to_not be_valid
  end
end
