class CreateUserGroups < ActiveRecord::Migration
  def change
    create_table :user_groups do |t|
      t.text :name
      t.text :description
      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
