require "rails_helper"

RSpec.describe Course, type: :model do
  let!(:category) {FactoryGirl.create :category}
  let!(:course) {FactoryGirl.create :course}

  it "is valid with valid attributes" do
    expect(course).to be_valid
  end

  it "is not valid without category_id" do
    course.category_id = nil
    expect(course).to_not be_valid
  end

  it "is not valid with a non-integer category_id" do
    course.category_id = 1.2
    expect(course).to_not be_valid
    course.category_id = "a"
    expect(course).to_not be_valid
  end

  it "is not valid without name" do
    course.name = "  "
    expect(course).to_not be_valid
  end

  it "is not valid without description" do
    course.description = "   "
    expect(course).to_not be_valid
  end

  it "is not valid with a long name" do
    course.name = "a" * 51
    expect(course).to_not be_valid
  end

  it "is not valid with a long description" do
    course.description = "a" * 251
    expect(course).to_not be_valid
  end
end
