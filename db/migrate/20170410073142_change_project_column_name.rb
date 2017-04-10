class ChangeProjectColumnName < ActiveRecord::Migration
  def change
    remove_column :projects, :type, :string
    add_column :projects, :proj_types, :string
  end
end
