class CreateBehaviors < ActiveRecord::Migration
  def self.up
    create_table :behaviors do |t|
      t.column    :behavior_id,   :integer,   :null => false
      t.column    :behavior_description,  :string,  :limit => 50
      t.timestamps
    end
    behavior = Behavior.new
    behavior.behavior_id = 0
    behavior.behavior_description = 'Beacon'
    behavior.save(false)
    behavior = Behavior.new
    behavior.behavior_id = 1
    behavior.behavior_description = 'Match'
    behavior.save(false)
    behavior = Behavior.new
    behavior.behavior_id = 2
    behavior.behavior_description = 'Search'
    behavior.save(false)
  end

  def self.down
    drop_table :behaviors
  end
end
