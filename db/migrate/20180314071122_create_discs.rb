class CreateDiscs < ActiveRecord::Migration[5.1]
  def change
    create_table :discs do |t|

    # 追加したカラム
      t.string :disc_name, null: false
      t.integer :disc_num, null: false
      t.integer :item_id, null: false, index: true

      t.timestamps
    end
  end
end
