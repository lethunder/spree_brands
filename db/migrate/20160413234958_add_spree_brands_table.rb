class AddSpreeBrandsTable < ActiveRecord::Migration
  def change
    create_table :spree_brands do |t|
      t.string   :name
      t.string   :description
      t.datetime :available_on
      t.boolean  :active, default: 'false'
      t.datetime :deleted_at

      t.timestamps
    end
  end
end