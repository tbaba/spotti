class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.text :description, null: false
      t.float :lat
      t.float :long
      t.references :user, index: true
      t.string :picture

      t.timestamps
    end
  end
end
