class AddTimeSpreeOrder < ActiveRecord::Migration
  def change
  	add_column :spree_orders, :time_delivery_id, :integer
  end
end
