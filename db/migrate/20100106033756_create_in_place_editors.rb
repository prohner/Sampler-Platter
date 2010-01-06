class CreateInPlaceEditors < ActiveRecord::Migration
  def self.up
    create_table :in_place_editors do |t|
      t.string :name
      t.string :email
      t.string :phone

      t.timestamps
    end
  end

  def self.down
    drop_table :in_place_editors
  end
end
