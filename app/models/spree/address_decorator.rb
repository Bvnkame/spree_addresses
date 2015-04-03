Spree::Address.class_eval do
	validates :full_name, :address1, :city, :district, presence: true
    
end