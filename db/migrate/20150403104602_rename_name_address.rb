class RenameNameAddress < ActiveRecord::Migration
  def change
  	rename_column :spree_addresses, :full_name, :user_name
  end
end
