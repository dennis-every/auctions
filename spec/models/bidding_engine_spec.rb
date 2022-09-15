require 'rails_helper'

describe BiddingEngine, type: :model do
  describe '.bid!' do
    let(:seller) {User.create(:email => 'seller@test.com', :password => 'password')}
    let(:bidder) {User.create(:email => 'bidder@test.com', :password => 'password')}
    let(:auction) {Auction.create(
      title: 'Auction 1',
      description: 'Description',
      start_date: DateTime.now,
      end_date: DateTime.now + 1.week,
      user_id: seller.id
    )}

    it 'create a new bid on an auction' do
      described_class.bid!(auction, 100, bidder)
      expect(auction.errors).to be_empty

      described_class.bid!(auction, 90, bidder)
      expect(auction.errors[:bid].first).to eq "must be bigger than the last bid on the auction"
    end
    it 'cannot create a bid if its an equal amount as the last bid' do      
      described_class.bid!(auction, 100, bidder)
      expect(auction.errors).to be_empty

      described_class.bid!(auction, 100, bidder)
      expect(auction.errors[:bid].first).to eq "must be bigger than the last bid on the auction"
    end
  end

end
