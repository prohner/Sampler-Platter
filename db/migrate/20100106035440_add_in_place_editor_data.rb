class AddInPlaceEditorData < ActiveRecord::Migration
  def self.up
    ipe = InPlaceEditor.new(:name => 'Preston', :email => 'preston@preston.com', :phone => '818-555-1212')
    ipe.save

    ipe = InPlaceEditor.new(:name => 'Clark', :email => 'clark@clark.com', :phone => '818-555-1234')
    ipe.save

  end

  def self.down
  end
end
