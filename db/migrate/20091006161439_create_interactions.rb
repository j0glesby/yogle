class CreateInteractions < ActiveRecord::Migration
  def self.up
    create_table :interactions do |t|
      t.column  :user_id,       :integer,   :null => false
      t.column  :interaction_category_id, :integer, :null => false
      t.column  :behavior_id,   :integer,   :null => false,   :default => 1
      t.column  :description,   :string,    :limit => 50
      t.column  :content,       :string,    :limit => 320
      t.column  :enabled,       :boolean,   :null => false,   :default => true
      t.column  :image_id,      :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :interactions
  end
end
