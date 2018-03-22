class RemoveNullToUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :null, :string
  end
end
