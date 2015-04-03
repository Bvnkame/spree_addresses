module Spree
  module PermittedAttributes

    @@address_attributes = [
       :id, :user_name, :district, :firstname, :lastname, :first_name, :last_name,
      :address1, :address2, :city, :country_id, :state_id,
      :zipcode, :phone, :state_name, :alternative_phone, :company,
      country: [:iso, :name, :iso3, :iso_name],
      state: [:name, :abbr] ]
     
    end
  end