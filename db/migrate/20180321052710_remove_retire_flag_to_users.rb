class RemoveRetireFlagToUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :retire_flag, :boolean
  end
end
