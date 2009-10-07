class CreateComplaints < ActiveRecord::Migration
  def self.up
    create_table :complaints do |t|
      t.column    :user_id,       :integer,   :null => false
      t.column    :defendant_id,  :integer,   :null => false
      t.column    :reason,        :string,    :limit => 160
      t.column    :event_id,      :integer,   :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :complaints
  end
end
