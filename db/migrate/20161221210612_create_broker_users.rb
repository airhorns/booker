class CreateBrokerUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :broker_users do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.references :brokerage
      t.boolean :is_owner

      t.timestamps
    end
  end
end
