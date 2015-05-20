class ChangeDetailSpreeAddresses < ActiveRecord::Migration
  def change
  	add_column :spree_addresses, :full_name, :string
  	add_column :spree_addresses, :district, :string
  end
end
