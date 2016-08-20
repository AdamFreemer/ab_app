class Clip < ActiveRecord::Base
  belongs_to :experience
  has_many :votes
end
