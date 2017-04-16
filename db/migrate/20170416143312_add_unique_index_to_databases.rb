class AddUniqueIndexToDatabases < ActiveRecord::Migration
  def change
  	change_column :users, :name, :string
  	add_index :users, :name, unique: true
  	add_index :groups, :name, unique: true
  	add_index :projects, :abbr_name, unique: true
  end
end
