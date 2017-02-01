class AddAddressToBrokerage < ActiveRecord::Migration[5.0]
  def change
    add_column :brokerages, :street_1, :string
    add_column :brokerages, :street_2, :string
    add_column :brokerages, :city, :string
    add_column :brokerages, :region, :string
    add_column :brokerages, :country, :string
    add_column :brokerages, :postal_code, :string
    add_column :brokerages, :valid_listing_cities, :string, array: true, default: []
    add_column :brokerages, :valid_listing_regions, :string, array: true, default: []
    add_column :brokerages, :valid_listing_countries, :string, array: true, default: []
  end
end
