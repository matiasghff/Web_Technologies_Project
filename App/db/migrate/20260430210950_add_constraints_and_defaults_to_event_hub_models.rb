class AddConstraintsAndDefaultsToEventHubModels < ActiveRecord::Migration[8.1]
  def change
    change_column_default :users, :role, from: nil, to: 0
    change_column_default :events, :status, from: nil, to: 0
    change_column_default :registrations, :status, from: nil, to: 0

    add_index :users, "LOWER(email)", unique: true, name: "index_users_on_lower_email"
    add_index :categories, "LOWER(name)", unique: true, name: "index_categories_on_lower_name"

    add_index :registrations,
              [:user_id, :event_id],
              unique: true,
              name: "index_registrations_on_user_id_and_event_id"

    add_index :reviews,
              [:user_id, :event_id],
              unique: true,
              name: "index_reviews_on_user_id_and_event_id"
  end
end