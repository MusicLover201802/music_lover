class RemoveProfileImageIdFromItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :items, :profile_image_id, :string
  end
end
