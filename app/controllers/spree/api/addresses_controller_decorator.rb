Spree::Api::AddressesController.class_eval do
	before_action :find_order, :except => [:create]
	before_action :authenticate_user

	def create
		@time_delivery = Add::TimeDelivery.find(params[:time_delivery_id])
		
		if @time_delivery 
			address = Spree::Address.create(address_params)
			address.user_id = current_api_user.id
			address.save!
			@order = Spree::Order.where(number: params[:cart_number]).first
			if @order
				@order.time_delivery_id = @time_delivery.id
				@order.ship_address_id = address.id
				@order.save!
				@status = [ { "messages" => "Add Address Successful"}]
				render "spree/api/logger/log", status: 200
			else
				@status = [ { "messages" => "The resource you were looking for could not be found."}]
				render "spree/api/logger/log", status: 404
			end
		else
			invalid_resource!(@time_delivery)
		end
	end

	def show
		
	end
end
