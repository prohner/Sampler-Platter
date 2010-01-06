class AddPaginationItems < ActiveRecord::Migration
  def self.up

    pi = PaginationItem.new(:name => 'hoe', :quantity => 3, :price => 10)
    pi.save
    pi = PaginationItem.new(:name => 'wheelbarrow', :quantity => 2, :price => 60);
    pi.save
    pi = PaginationItem.new(:name => 'gherkin', :quantity => 15, :price => 3);
    pi.save
    pi = PaginationItem.new(:name => 'batman', :quantity =>  1, :price => 3000);
    pi.save
    pi = PaginationItem.new(:name => 'fish sausage', :quantity => 2, :price => 8);
    pi.save
    pi = PaginationItem.new(:name => 'sauerkraut', :quantity => 9, :price => 9);
    pi.save
    pi = PaginationItem.new(:name => 'watering-can', :quantity => 4, :price => 13);
    pi.save
    pi = PaginationItem.new(:name => 'dandelions', :quantity => 78, :price => 1);
    pi.save
    pi = PaginationItem.new(:name => 'refrigerator', :quantity => 12, :price => 250);
    pi.save
    pi = PaginationItem.new(:name => 'flying matches', :quantity => 8, :price => 145);
    pi.save
    pi = PaginationItem.new(:name => 'broken accordion', :quantity => 1, :price => 18);
    pi.save
    pi = PaginationItem.new(:name => 'savage whisper', :quantity => 5, :price => 7);
    pi.save
    pi = PaginationItem.new(:name => 'hysterical snail', :quantity => 8, :price => 13);
    pi.save

  end

  def self.down
  end
end
