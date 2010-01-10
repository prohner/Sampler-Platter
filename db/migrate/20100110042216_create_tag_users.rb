class CreateTagUsers < ActiveRecord::Migration
  def self.up
    create_table :tag_users do |t|
      t.string :name
      t.string :skills
      t.string :interests

      t.timestamps
    end
  end

  def self.down
    drop_table :tag_users
  end
end
