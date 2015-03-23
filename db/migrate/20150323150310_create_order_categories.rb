class CreateOrderCategories < ActiveRecord::Migration
  def change
    create_table :order_categories do |t|
      t.references :order, index: true
      t.references :category, index: true
    end
  end
end
