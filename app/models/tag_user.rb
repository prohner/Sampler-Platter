class TagUser < ActiveRecord::Base
  acts_as_taggable_on :tags, :skills, :interests
end
