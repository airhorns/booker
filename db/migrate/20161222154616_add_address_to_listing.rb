class AddAddressToListing < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :street_1, :string, null: false
    add_column :listings, :street_2, :string
    add_column :listings, :city, :string, null: false
    add_column :listings, :country, :string, null: false
    add_column :listings, :region, :string
    add_column :listings, :postal_code, :string
    add_column :listings, :latitude, :float
    add_column :listings, :longitude, :float
  end
end
