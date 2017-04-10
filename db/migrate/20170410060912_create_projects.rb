class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :abbr_name
      t.string :name
      t.string :types
      t.datetime :proj_start_time
      t.datetime :proj_end_time

      t.timestamps null: false
    end
  end
end
