class CreateGenres < ActiveRecord::Migration[5.1]
  def change
    create_table :genres do |t|

	# 追加したカラム
	  t.string :genre_name, null: false, index: true

      t.timestamps
    end
  end
end
