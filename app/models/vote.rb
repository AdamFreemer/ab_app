class Vote < ActiveRecord::Base
  belongs_to :experience
  belongs_to :clip
  # validates :clip_id, presence: true
  # validates :confidence, presence: true
end
