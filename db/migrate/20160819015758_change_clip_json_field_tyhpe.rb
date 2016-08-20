class ChangeClipJsonFieldTyhpe < ActiveRecord::Migration
  def change
    change_column :clips, :player_json, :text
  end
end
