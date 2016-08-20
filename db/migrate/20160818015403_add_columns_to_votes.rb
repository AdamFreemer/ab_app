class AddColumnsToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :clip_id, :integer
    add_column :votes, :confidence, :integer
    add_column :clips, :votable, :boolean
  end
end
