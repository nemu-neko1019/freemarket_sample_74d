class AddPreparationDayToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :preparation_day, :string
  end
end
