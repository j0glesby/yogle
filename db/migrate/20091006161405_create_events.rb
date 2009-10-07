class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.column  :user_id,             :integer,   :null => false
      t.column  :event_type_id,       :integer,   :null => false
      t.column  :participant_id,      :integer
      t.column  :content,             :string,    :limit => 160
      t.column  :delivered,           :boolean,   :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
