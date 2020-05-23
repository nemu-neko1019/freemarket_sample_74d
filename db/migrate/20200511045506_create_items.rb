class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :introduction, null: false
      t.integer :price, null: false
      t.references :category, foreign_key: true
      t.references :bland, foreign_key: true
      t.integer :size, null: false
      t.integer :condition, null: false
      t.integer :postage_payer, null: false
      t.references :buyer, foreign_key: { to_table: :users }, null: false
      t.references :seller, foreign_key: { to_table: :users }, null: false
      t.integer :trading_status, null: false
      t.integer :prefecture_code, null: false
      t.timestamp :deal_closed_date
      t.timestamps
    end
  end
end
