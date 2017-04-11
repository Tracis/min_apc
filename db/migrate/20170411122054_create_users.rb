class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :name
      t.string :email
      t.text :description

      t.timestamps null: false
    end
  end
end
