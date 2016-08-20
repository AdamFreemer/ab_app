class Vote < ActiveRecord::Base
  belongs_to :experience
  belongs_to :clip
end
