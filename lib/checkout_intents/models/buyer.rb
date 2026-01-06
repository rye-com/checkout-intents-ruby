# frozen_string_literal: true

module CheckoutIntents
  module Models
    class Buyer < CheckoutIntents::Internal::Type::BaseModel
      # @!attribute address1
      #
      #   @return [String]
      required :address1, String

      # @!attribute city
      #
      #   @return [String]
      required :city, String

      # @!attribute country
      #
      #   @return [String]
      required :country, String

      # @!attribute email
      #
      #   @return [String]
      required :email, String

      # @!attribute first_name
      #
      #   @return [String]
      required :first_name, String, api_name: :firstName

      # @!attribute last_name
      #
      #   @return [String]
      required :last_name, String, api_name: :lastName

      # @!attribute phone
      #
      #   @return [String]
      required :phone, String

      # @!attribute postal_code
      #
      #   @return [String]
      required :postal_code, String, api_name: :postalCode

      # @!attribute province
      #
      #   @return [String]
      required :province, String

      # @!attribute address2
      #
      #   @return [String, nil]
      optional :address2, String

      # @!method initialize(address1:, city:, country:, email:, first_name:, last_name:, phone:, postal_code:, province:, address2: nil)
      #   @param address1 [String]
      #   @param city [String]
      #   @param country [String]
      #   @param email [String]
      #   @param first_name [String]
      #   @param last_name [String]
      #   @param phone [String]
      #   @param postal_code [String]
      #   @param province [String]
      #   @param address2 [String]
    end
  end
end
