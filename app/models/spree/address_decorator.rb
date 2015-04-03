Spree::Address.class_eval do

	belongs_to :user, foreign_key: :user_id, class_name: 'Spree::User'

	clear_validators!

	validates :address1, :city, :user_name, :district, presence: true


	# _validators.reject!{ |key, _| key == :firstname }

	# _validate_callbacks.reject! do |callback|
	# 	callback.raw_filter.attributes == [:firstname]
	end