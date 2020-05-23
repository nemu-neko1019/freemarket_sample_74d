class RemoveDetailsFromSendingDestinations < ActiveRecord::Migration[5.2]
  def change
    remove_column :sending_destinations, :familyname, :string
    remove_column :sending_destinations, :firstname, :string
    remove_column :sending_destinations, :firstname_kana, :string
    remove_column :sending_destinations, :familyname_kana, :string
  end
end
