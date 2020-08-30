# This migration comes from active_storage (originally 20170806125915)
class CreateActiveStorageTables < ActiveRecord::Migration[5.2]
  def change
    create_table :active_storage_blobs do |t|
      t.string   :key     
      t.string   :filename
      t.string   :content_type
      t.text     :metadata
      t.bigint   :byte_size
      t.string   :checksum
      t.datetime :created_at

      t.index [ :key ], unique: true
    end

    create_table :active_storage_attachments do |t|
      t.string     :name  
      t.references :record,   polymorphic: true, index: false
      t.references :blob   

      t.datetime :created_at

      t.index [ :record_type, :record_id, :name, :blob_id ], name: "index_active_storage_attachments_uniqueness", unique: true
      t.foreign_key :active_storage_blobs, column: :blob_id
    end
  end
end
