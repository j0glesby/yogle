class CreateBreadcrumbs < ActiveRecord::Migration
  def self.up
    create_table :breadcrumbs do |t|
      t.column  :latitude,      :decimal,   :precision => 10,   :scale => 7
      t.column  :longitude,     :decimal,   :precision => 10,   :scale => 7
      t.column  :user_id,       :integer,   :null => false
      t.column  :created_at,    :timestamp
    end
  end

  def self.down
    drop_table :breadcrumbs
  end
end
