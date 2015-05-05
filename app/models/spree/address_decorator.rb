Spree::Address.class_eval do

	clear_validators!

	validates :address1, :city,:phone, :user_name, :district, presence: true


	# _validators.reject!{ |key, _| key == :firstname }

	# _validate_callbacks.reject! do |callback|
	# 	callback.raw_filter.attributes == [:firstname]
	end