Spree::User.class_eval do
	has_many :addresses, :class_name => "Spree::Address"
end