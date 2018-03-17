class AddProfileImageIdToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :profile_image_id, :string
  end
end
