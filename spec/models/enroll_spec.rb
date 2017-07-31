require "rails_helper"

RSpec.describe Enroll, type: :model do
  let!(:category) {FactoryGirl.create :category}
  let!(:course) {FactoryGirl.create :course}
  let!(:user) {FactoryGirl.create :user}
  let!(:enroll) {FactoryGirl.create :enroll}

  it "is valid with valid attributes" do
    expect(enroll).to be_valid
  end

  it "is not valid without user_id" do
    enroll.user_id = nil
    expect(enroll).to_not be_valid
  end

  it "is not valid without course_id" do
    enroll.course_id = nil
    expect(enroll).to_not be_valid
  end

  it "is not valid without status" do
    enroll.status = nil
    expect(enroll).to_not be_valid
  end

  it "is not valid with a non-integer user_id" do
    enroll.user_id = 1.2
    expect(enroll).to_not be_valid
    enroll.user_id = "a"
    expect(enroll).to_not be_valid
  end

  it "is not valid with a non-integer course_id" do
    enroll.course_id = 1.2
    expect(enroll).to_not be_valid
    enroll.course_id = "a"
    expect(enroll).to_not be_valid
  end

  it "is not valid without date_start" do
    enroll.date_start = nil
    expect(enroll).to_not be_valid
  end

  it "is not valid when start after finish" do
    enroll.date_finish = (enroll.date_start.to_time - 1.hours).to_datetime
    expect(enroll).to_not be_valid
  end

end
