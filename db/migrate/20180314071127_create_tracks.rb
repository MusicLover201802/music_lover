class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks do |t|

	# 追加したカラム
	  t.integer :disc_id, null: false, index: true
	  t.string :track_name, null: false
	  t.integer :track_num, null: false

      t.timestamps
    end
  end
end
