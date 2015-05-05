class RemoveUsertoAddress < ActiveRecord::Migration
  def change
  	remove_column :spree_addresses, :user_id
  end
end
