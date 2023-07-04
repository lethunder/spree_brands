class AddSpreeBrandsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :spree_brands do |t|
      t.string   :name
      t.string   :description
      t.boolean  :active, default: true
      t.datetime :deleted_at

      t.timestamps
    end
  end
end