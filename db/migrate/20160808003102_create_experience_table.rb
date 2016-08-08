class CreateExperienceTable < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :name
      t.text :description
      t.timestamps
    end
  end
end
