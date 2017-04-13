class ChangeColumnDefaultToUsers < ActiveRecord::Migration
  def change
  	change_column_default :users, :actived, true
  end
end
