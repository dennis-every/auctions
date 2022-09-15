class Bid < ApplicationRecord

  belongs_to :bidder, class_name:'User'
  belongs_to :auction

  validates_presence_of :bidder


end
