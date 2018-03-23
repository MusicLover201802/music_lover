class ChangeDatatypeTitleOfRetireFlag < ActiveRecord::Migration[5.1]
  def change
  	change_column :users, :retire_flag, :boolean, null: true, default: false
  end
end
