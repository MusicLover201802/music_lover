class RemoveDefaultToUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :default, :string
  end
end
