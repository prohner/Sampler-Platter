class CreatePeoples < ActiveRecord::Migration
  def self.up
    create_table :peoples do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :peoples
  end
end
