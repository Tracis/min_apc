class CreateGroupsUsers < ActiveRecord::Migration
  def change
    create_table :groups_users, id: false do |t|
      t.belongs_to :groups
      t.belongs_to :users
    end

    add_index :groups_users, :group_id
    add_index :groups_users, :user_id
  end
end
