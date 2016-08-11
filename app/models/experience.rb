class Experience < ActiveRecord::Base
  acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :category
  has_many :votes
  has_many :clips
end