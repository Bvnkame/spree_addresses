Spree::Address.class_eval do
	clear_validators!
	validates :address1, :city,:phone, :user_name, :district, presence: true
end