class RenamePreparationDayColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :preparation_day, :preparation_day_id
  end
end
