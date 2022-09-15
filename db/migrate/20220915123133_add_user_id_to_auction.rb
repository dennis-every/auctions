class AddUserIdToAuction < ActiveRecord::Migration[7.0]
  def change
    add_column :auctions, :user_id, :integer
    add_index :auctions, :user_id
  end
end
