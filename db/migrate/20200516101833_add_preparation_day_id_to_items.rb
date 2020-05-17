class AddPreparationDayIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :preparation_day_id, :integer, null: false
  end
end
