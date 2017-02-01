class CreateListingManagers < ActiveRecord::Migration[5.0]
  def change
    create_table :listing_managers do |t|
      t.references :client, foreign_key: true, null: false
      t.references :listing, foreign_key: true, null: false

      t.timestamps
    end
  end
end
