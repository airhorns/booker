class CreateBrokerages < ActiveRecord::Migration[5.0]
  def change
    create_table :brokerages do |t|
      t.string :name
      t.string :logo_url

      t.timestamps
    end
  end
end
