require 'rails_helper'

describe Auction, type: :model do

  let(:seller) {
    User.new(
      email: "test@test.com",
      password: "password"
    )
  }

  subject { described_class.new(
    title: 'Test',
    description: 'Desc',
    start_date: DateTime.now,
    end_date: DateTime.now + 1.week,
    user_id: 1
    ) }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a description' do
      subject.description = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a start date' do
      subject.start_date = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a end date' do
      subject.end_date = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'Associations' do
    it {is_expected.to belong_to(:user).without_validating_presence}
    it {is_expected.to have_many(:bids)}
  end





end
