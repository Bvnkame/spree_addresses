class AddUseridSpreeAddress < ActiveRecord::Migration
  def change
  		add_column :spree_addresses, :user_id, :integer
  end
end
