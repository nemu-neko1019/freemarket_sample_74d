class CreateSendingDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :sending_destinations do |t|
      t.string :firstname, null: false
      t.string :familyname, null: false
      t.string :firstname_kana, null: false
      t.string :familyname_kana, null: false
      t.integer :prefecture_code, null: false
      t.string :municipal_district, null: false
      t.string :housenumber, null: false
      t.string :buildingname
      t.integer :phonenumber, unique: true, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
