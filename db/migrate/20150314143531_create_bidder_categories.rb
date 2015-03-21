class CreateBidderCategories < ActiveRecord::Migration
  def change
    create_table :bidder_categories do |t|
      t.references :user, :index => true
      t.references :category, :index => true
    end
  end
end
