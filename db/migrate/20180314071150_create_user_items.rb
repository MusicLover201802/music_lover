class CreateUserItems < ActiveRecord::Migration[5.1]
  def change
    create_table :user_items do |t|

      # 追加したカラム
      t.integer :user_id, null: false, index: true
      t.integer :item_id, null: false, index: true
      t.integer :quantity, null: false, default: "1"

      t.timestamps
    end
  end
end
