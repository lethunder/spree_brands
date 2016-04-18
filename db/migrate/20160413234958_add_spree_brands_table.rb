class AddSpreeBrandsTable < ActiveRecord::Migration
  def change
    create_table :spree_brands do |t|
      t.string   :name
      t.string   :description
      t.datetime :available_on
      t.boolean  :active, default: 'false'
      t.string   :image_file_name
      t.string   :image_content_type
      t.integer  :image_file_size
      t.datetime :image_updated_at
      t.datetime :deleted_at

      t.timestamps
    end
  end
end