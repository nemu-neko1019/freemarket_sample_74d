class AddPostalcodeToSendingDestinations < ActiveRecord::Migration[5.2]
  def change
    add_column :sending_destinations, :postalcode, :integer
  end
end
