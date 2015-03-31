class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.references :order, :index => true
      t.references :bidder, :index => true
      t.text :content, :null => false

      t.timestamps null: false
    end
  end
end
