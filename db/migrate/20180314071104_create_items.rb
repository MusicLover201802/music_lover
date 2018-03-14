class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|

      #追加したカラム
      t.string  :item_name,        null: false, index: true
      t.string  :artist_name,      null: false, index: true
      t.string  :artist_name_kana, null: false, index: true
      t.integer :genre_id,         null: false, index: true
      t.integer :price,            null: false
      t.string  :label_name
      t.integer :stock,            null: false
      t.date    :release_date,     null: false
      t.boolean :purchase_flag,    null: false
      t.integer :admin_id,         null: false, index: true

      t.timestamps
    end
  end
end
