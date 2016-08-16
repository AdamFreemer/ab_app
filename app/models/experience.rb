class Experience < ActiveRecord::Base
  acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :category
  has_many :votes, dependent: :destroy
  has_many :clips, dependent: :destroy
end
