require "rails_helper"

RSpec.describe Lesson, type: :model do
  let!(:category) {FactoryGirl.create :category}
  let!(:course) {FactoryGirl.create :course}
  let!(:lesson) {FactoryGirl.create :lesson}

  it "is valid with valid attributes" do
    expect(lesson).to be_valid
  end

  it "is not valid without course_id" do
    lesson.course_id = nil
    expect(lesson).to_not be_valid
  end

  it "is not valid with a non-integer course_id" do
    lesson.course_id = 1.2
    expect(lesson).to_not be_valid
    lesson.course_id = "a"
    expect(lesson).to_not be_valid
  end

  it "is not valid without name" do
    lesson.name = "   "
    expect(lesson).to_not be_valid
  end

  it "is not valid with a long name" do
    lesson.name = "a" * 51
    expect(lesson).to_not be_valid
  end
end
