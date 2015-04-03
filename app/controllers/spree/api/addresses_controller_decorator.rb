Spree::Api::AddressesController.class_eval do
	before_action :find_order, :except => [:create]
	before_action :authenticate_user

	def create
		p address_params
		@time_delivery = Add::TimeDelivery.find(params[:time_delivery_id])
		if @time_delivery
			address = Spree::Address.create(address_params)

			p "kfjasdkfjasdfa address"
			p address
			address.user_id = current_api_user.id
			p 9999999999999999999999
			address.save!
			p "adfsdfasdf"
			p address.errors
			@status = [ { "messages" => "Add Address Successful"}]
			render "spree/api/logger/log", status: 200
		else
			invalid_resource!(@nutrition)
		end
	end
end
	