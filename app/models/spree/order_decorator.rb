Spree::Order.class_eval do 
	belongs_to :time_delivery, foreign_key: :time_delivery_id, class_name: 'Add::TimeDelivery'
end