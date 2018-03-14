class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|

   # 追加したカラム
      t.integer :item_id, null: false, index: true
      t.integer :quantity, null: false
      t.integer :price, null: false
      t.integer :order_id, null: false, index: true

      t.timestamps
    end
  end
end
