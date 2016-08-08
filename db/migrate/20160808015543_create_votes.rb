class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :name
      t.string :author
      t.string :url
      t.string :format
      t.text :notes
      t.timestamps null: false
    end
  end
end
