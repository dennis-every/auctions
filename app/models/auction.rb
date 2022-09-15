class Auction < ApplicationRecord

  belongs_to :user, optional: true
  has_many :bids

  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :start_date
  validates_presence_of :end_date

end
