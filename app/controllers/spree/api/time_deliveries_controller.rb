module Spree
	module Api
		class TimeDeliveriesController < BaseApiController

			def index
				@time_deliveries = Add::TimeDelivery.all.ransack(params[:q]).result
				render "spree/api/time_deliveries/index"
			end

			def create
				Add::TimeDelivery.create(timedelivery_params)
				@status = [ { "messages" => "Add Time Delivery Successful"}]
				render "spree/api/logger/log", status: 200
			end

			private

			def timedelivery_params
				params.require(:time_delivery).permit(:delivery_time)
			end

		end
	end
end
