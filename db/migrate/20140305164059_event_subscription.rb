class EventSubscription < ActiveRecord::Migration
  def change
    return if ActiveRecord::Base.connection.table_exists? :events_users
    rename_table :events_users, :event_subscriptions
    add_column :event_subscriptions, :data, :hstore
    add_column :event_subscriptions, :deleted_at, :datetime
    add_index :event_subscriptions, :deleted_at
    add_column :event_subscriptions, :id, :primary_key
  end
end
