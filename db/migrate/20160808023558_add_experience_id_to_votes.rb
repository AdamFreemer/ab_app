class AddExperienceIdToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :experience_id, :integer
  end
end
