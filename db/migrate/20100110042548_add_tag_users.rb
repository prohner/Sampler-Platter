class AddTagUsers < ActiveRecord::Migration
  def self.up
    TagUser.delete_all
    
    tu = TagUser.new(:name => "Preston")
    tu.tag_list = "awesome, slick, hefty"
    tu.skill_list = "karate, joking, running"
    tu.save
    
    tu = TagUser.new(:name => "Lexi")
    tu.tag_list = "funny, wife, funny"
    tu.skill_list = "skating, joking, writing"
    tu.save
    
    tu = TagUser.new(:name => "Sam")
    tu.tag_list = "funny, son"
    tu.skill_list = "football, joking, writing"
    tu.save
    
  end

  def self.down
    TagUser.delete_all
  end
end
