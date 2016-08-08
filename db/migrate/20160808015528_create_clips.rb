class CreateClips < ActiveRecord::Migration
  def change
    create_table :clips do |t|
      t.integer :experience_id
      t.string :session_ip
      t.string :session_browser_platform
      t.string :session_browser_name
      t.string :session_browser_version
      t.text :description
      t.timestamps null: false
    end
  end
end