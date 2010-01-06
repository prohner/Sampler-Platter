class CreateFoodItems < ActiveRecord::Migration
  def self.up
    create_table :food_items do |t|
      t.string :name
      t.integer :grocery_list_id
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :food_items
  end
end
