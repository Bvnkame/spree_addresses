Spree::Api::AddressesController.class_eval do
	before_action :find_order, :except => [:create]
	def create
		p address_params
		
		@status = [ { "messages" => "Add Address Successful"}]
		render "spree/api/logger/log", status: 200
	end
end
	