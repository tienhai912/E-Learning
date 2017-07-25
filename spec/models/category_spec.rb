require "rails_helper"

RSpec.describe Category, type: :model do
  let(:category) {FactoryGirl.create :category}

  it "is valid with valid attributes" do
    expect(category).to be_valid
  end

  it "is not valid without name" do
    category.name = "  "
    expect(category).to_not be_valid
  end

  it "is not valid without description" do
    category.description = "   "
    expect(category).to_not be_valid
  end

  it "is not valid with a long name" do
    category.name = "a" * 51
    expect(category).to_not be_valid
  end

  it "is not valid with a long description" do
    category.description = "a" * 251
    expect(category).to_not be_valid
  end
end
