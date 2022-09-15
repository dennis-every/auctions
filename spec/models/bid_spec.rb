require 'rails_helper'

describe Bid, type: :model do
  describe 'Validations' do
    it {is_expected.to validate_presence_of :bidder}
  end
  describe 'Associations' do
    it {is_expected.to belong_to(:bidder)}
    it {is_expected.to belong_to(:auction)}
  end
end
