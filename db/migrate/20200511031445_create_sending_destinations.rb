class CreateSendingDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :sending_destinations do |t|
      t.integer :postalcode, null: false
      t.integer :prefecture_id, null: false
      t.string :municipal_district, null: false
      t.string :housenumber, null: false
      t.string :buildingname
      t.string :phonenumber, unique: true, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
