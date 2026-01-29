# frozen_string_literal: true

module CheckoutIntents
  module Models
    class Money < CheckoutIntents::Internal::Type::BaseModel
      # @!attribute amount_subunits
      #
      #   @return [Integer]
      required :amount_subunits, Integer, api_name: :amountSubunits

      # @!attribute currency_code
      #
      #   @return [String]
      required :currency_code, String, api_name: :currencyCode

      # @!method initialize(amount_subunits:, currency_code:)
      #   @param amount_subunits [Integer]
      #   @param currency_code [String]
    end
  end
end
