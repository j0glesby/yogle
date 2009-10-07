class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.column  :user_id,       :integer,   :null => false
      t.column  :image_location,    :string,  :null => false
      t.column  :image_description, :string,  :limit => 50
      t.column  :sharing,       :boolean,   :default => true
      t.timestamps
    end
  end

  def self.down
    drop_table :images
  end
end
