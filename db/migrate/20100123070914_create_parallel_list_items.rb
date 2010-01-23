class CreateParallelListItems < ActiveRecord::Migration
  def self.up
    create_table :parallel_list_items do |t|
      t.string :name
      t.boolean :is_selected
      t.integer :position

      t.timestamps
    end
    
    pli = ParallelListItem.create(:name => 'Preston', :is_selected => true, :position => 1)
    pli = ParallelListItem.create(:name => 'Tom',     :is_selected => true, :position => 2)
    pli = ParallelListItem.create(:name => 'Aaron',   :is_selected => false, :position => 3)
    pli = ParallelListItem.create(:name => 'Ihor',    :is_selected => false, :position => 4)
    
  end

  def self.down
    drop_table :parallel_list_items
  end
end
