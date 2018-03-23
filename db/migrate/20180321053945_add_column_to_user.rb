class AddColumnToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :retire_flag, :boolean
    add_column :users, :null, :true
    add_column :users, :default, :false
  end
end
