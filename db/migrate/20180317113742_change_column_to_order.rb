class ChangeColumnToOrder < ActiveRecord::Migration[5.1]
  def change
  	change_column :orders, :status, :string, default: "商品準備中"
  end
end
