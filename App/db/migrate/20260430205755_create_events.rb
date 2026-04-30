class CreateEvents < ActiveRecord::Migration[8.1]
  def change
    create_table :events do |t|
      t.string :title
      t.integer :status
      t.datetime :starts_at
      t.datetime :ends_at
      t.integer :max_attendees
      t.references :organizer, null: false, foreign_key: { to_table: :users }
      t.references :category, null: false, foreign_key: true
      t.references :venue, null: false, foreign_key: true

      t.timestamps
    end
  end
end