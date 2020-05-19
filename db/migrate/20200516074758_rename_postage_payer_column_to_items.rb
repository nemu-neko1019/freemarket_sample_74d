class RenamePostagePayerColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :postage_payer, :postage_payer_id
  end
end
