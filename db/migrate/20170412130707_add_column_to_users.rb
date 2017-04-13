class AddColumnToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :actived, :boolean
  	add_column :users, :deleted_at, :datetime
  end
end
