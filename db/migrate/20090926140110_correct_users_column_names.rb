class CorrectUsersColumnNames < ActiveRecord::Migration
  def self.up
    rename_column :users, :firstName, :first_name
    rename_column :users, :lastName, :last_name
  end

  def self.down
    rename_column :users, :first_name, :firstName
    rename_column :users, :last_name, :lastName
  end
end
