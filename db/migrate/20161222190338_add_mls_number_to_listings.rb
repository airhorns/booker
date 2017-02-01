class AddMlsNumberToListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :mls_number, :string
  end
end
