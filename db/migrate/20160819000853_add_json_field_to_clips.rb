class AddJsonFieldToClips < ActiveRecord::Migration
  def change
      add_column :clips, :player_json, :string
  end
end
