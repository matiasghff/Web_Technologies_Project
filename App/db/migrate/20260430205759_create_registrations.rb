class CreateRegistrations < ActiveRecord::Migration[8.1]
  def change
    create_table :registrations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.integer :status
      t.datetime :registered_at
      t.datetime :cancelled_at
      t.integer :waitlist_position

      t.timestamps
    end
  end
end
