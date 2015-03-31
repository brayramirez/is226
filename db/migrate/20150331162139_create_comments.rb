class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :bid, :index => true
      t.references :commenter, :index => true
      t.text :content, :null => false

      t.timestamps null: false
    end
  end
end
