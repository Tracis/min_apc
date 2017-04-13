class AddIndexToProjectUser < ActiveRecord::Migration
  def change
  	add_index :project_users, :project_id
  	add_index :project_users, :user_id
  end
end
