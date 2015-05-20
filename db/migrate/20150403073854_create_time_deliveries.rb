class CreateTimeDeliveries < ActiveRecord::Migration
  def change
    create_table :time_deliveries do |t|

    	t.string :delivery_time

      t.timestamps
    end
  end
end
