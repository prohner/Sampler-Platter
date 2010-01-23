class CreateParallelListItems < ActiveRecord::Migration
  def self.up
    create_table :parallel_list_items do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :parallel_list_items
  end
end
