class CreateInteractionCategories < ActiveRecord::Migration
  def self.up
    create_table :interaction_categories do |t|
      t.column    :user_id,       :integer,   :null => false
      t.column    :interaction_category_description,  :string,  :limit => 50,   :null => false
      t.column    :show_flag,     :integer,   :null => false,   :default => 2
      t.timestamps
    end
    # Make sure admin user exists before running
    user = User.find_by_login('admin')
    interaction_category = InteractionCategory.new
    interaction_category.user = user
    interaction_category.interaction_category_description = 'Professional'
    interaction_category.show_flag = 1
    interaction_category.save(false)
    
    interaction_category = InteractionCategory.new
    interaction_category.user = user
    interaction_category.interaction_category_description = 'Personal'
    interaction_category.show_flag = 2
    interaction_category.save(false)
  end

  def self.down
    drop_table :interaction_categories
  end
end
