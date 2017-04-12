class AddForeighKeyToUsersGroup < ActiveRecord::Migration
  def change
  	add_foreign_key :users_groups, :users
  	add_foreign_key :users_groups, :groups
  end
end
