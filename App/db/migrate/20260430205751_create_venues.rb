class CreateVenues < ActiveRecord::Migration[8.1]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :building
      t.string :room
      t.string :address
      t.integer :max_capacity

      t.timestamps
    end
  end
end
