class DropActiveStorageTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :active_storage_blobs
    drop_table :active_storage_attachments
  end
end
