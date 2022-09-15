class CreateBids < ActiveRecord::Migration[7.0]
  def change
    create_table :bids do |t|
      t.integer :bidder_id
      t.integer :auction_id
      t.integer :amount

      t.timestamps
    end
    add_index :bids, :bidder_id
    add_index :bids, :auction_id
  end
end
