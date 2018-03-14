class CreateDestinations < ActiveRecord::Migration[5.1]
  def change
    create_table :destinations do |t|

  	  # 追加したカラム
      t.string  :last_name,       null: false, index: true
      t.string  :first_name,      null: false, index: true
      t.string  :last_name_kana,  null: false, index: true
      t.string  :first_name_kana, null: false, index: true
      t.string  :postal_code,     null: false
      t.integer :prefecture,      null: false
      t.string  :city,            null: false
      t.string  :building
      t.string  :phone_number,    null: false
      t.integer :user_id,         null: false, index: true

      t.timestamps
    end
  end
end
