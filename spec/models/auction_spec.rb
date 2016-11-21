require 'rails_helper'

RSpec.describe Auction, :type => :model do
  let(:seller) { User.new(:email => "jane@doe.com", :password => "pw1234",
                       :password_confirmation => "pw1234") }
subject {
  described_class.new(title: "Anything", description: "Lorem ipsum",
                    start_date: DateTime.now, end_date: DateTime.now + 1.week,
                    seller: seller)
}

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a description" do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a start_date" do
    subject.start_date = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a end_date" do
    subject.end_date = nil
    expect(subject).to_not be_valid
  end
  it "has one buyer" do
    subject = described_class.reflect_on_association(:buyer)
    expect(subject.macro).to eq :has_one
  end

  it "has one seller" do
    subject = described_class.reflect_on_association(:seller)
    expect(subject.macro).to eq :has_one
  end
end

