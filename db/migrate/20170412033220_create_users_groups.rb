class CreateUsersGroups < ActiveRecord::Migration
  def change
    create_table :users_groups, id: false do |t|
      t.integer :group_id
      t.integer :user_id

      t.timestamps null: false
    end

    add_index :users_groups, :group_id
    add_index :users_groups, :user_id
  end
end
