class CreateBidderAccountCategories < ActiveRecord::Migration
  def change
    create_table :bidder_account_categories do |t|
      t.references :bidder_account, :index => true
      t.references :category, :index => true
    end
  end
end
