Spree::Api::AddressesController.class_eval do
	before_action :find_order, :except => [:create, :update, :latest_address]
	before_action :authenticate_user

	def create
		@time_delivery = Add::TimeDelivery.find(params[:time_delivery_id])
		
		if @time_delivery 
			address = Spree::Address.create(address_params)
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

	def update
		@order = Spree::Order.find_by!(ship_address_id: params[:id])
		authorize! :update, @order
		@address = Spree::Address.find(params[:id])
		if @address
			if @address.update(address_params)
				@status = [ { "messages" => "Update Address Successful"}]
				render "spree/api/logger/log", status: 200
			end
		else
			invalid_resource!(@address)
		end
	end

	def latest_address
		@user = Spree::User.find(current_api_user.id)
		@order = @user.orders.order(:updated_at).last
		render "spree/api/addresses/show", status: 200
	end

	private 
	def address_params
		params.require(:address).permit(:user_name, :address1, :phone, :city, :district)
	end
end
