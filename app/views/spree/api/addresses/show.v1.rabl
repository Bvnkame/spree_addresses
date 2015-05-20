object @order
child :ship_address => :address do
	attributes :id, :user_name, :phone, :address1, :district, :city
end
node(:time_delivery_id) { |p| p.time_delivery_id }	

