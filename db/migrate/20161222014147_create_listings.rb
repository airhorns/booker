class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.string :title, null: false
      t.text :description
      t.boolean :client_managed, null: false, default: true
      t.references :brokerage, foreign_key: true
      t.references :creator, foreign_key: { to_table: 'broker_users' }
      t.string :image_url
      t.timestamp :activated_at
      t.timestamps
    end
  end
end
