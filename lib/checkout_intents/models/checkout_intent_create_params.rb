# frozen_string_literal: true

module CheckoutIntents
  module Models
    # @see CheckoutIntents::Resources::CheckoutIntents#create
    class CheckoutIntentCreateParams < CheckoutIntents::Internal::Type::BaseModel
      extend CheckoutIntents::Internal::Type::RequestParameters::Converter
      include CheckoutIntents::Internal::Type::RequestParameters

      # @!attribute buyer
      #
      #   @return [CheckoutIntents::Models::Buyer]
      required :buyer, -> { CheckoutIntents::Buyer }

      # @!attribute product_url
      #
      #   @return [String]
      required :product_url, String, api_name: :productUrl

      # @!attribute quantity
      #
      #   @return [Float]
      required :quantity, Float

      # @!attribute constraints
      #
      #   @return [CheckoutIntents::Models::CheckoutIntentCreateParams::Constraints, nil]
      optional :constraints, -> { CheckoutIntents::CheckoutIntentCreateParams::Constraints }

      # @!attribute promo_codes
      #
      #   @return [Array<String>, nil]
      optional :promo_codes, CheckoutIntents::Internal::Type::ArrayOf[String], api_name: :promoCodes

      # @!attribute variant_selections
      #
      #   @return [Array<CheckoutIntents::Models::VariantSelection>, nil]
      optional :variant_selections,
               -> { CheckoutIntents::Internal::Type::ArrayOf[CheckoutIntents::VariantSelection] },
               api_name: :variantSelections

      # @!method initialize(buyer:, product_url:, quantity:, constraints: nil, promo_codes: nil, variant_selections: nil, request_options: {})
      #   @param buyer [CheckoutIntents::Models::Buyer]
      #   @param product_url [String]
      #   @param quantity [Float]
      #   @param constraints [CheckoutIntents::Models::CheckoutIntentCreateParams::Constraints]
      #   @param promo_codes [Array<String>]
      #   @param variant_selections [Array<CheckoutIntents::Models::VariantSelection>]
      #   @param request_options [CheckoutIntents::RequestOptions, Hash{Symbol=>Object}]

      class Constraints < CheckoutIntents::Internal::Type::BaseModel
        # @!attribute max_shipping_price
        #
        #   @return [Integer, nil]
        optional :max_shipping_price, Integer, api_name: :maxShippingPrice

        # @!attribute max_total_price
        #
        #   @return [Integer, nil]
        optional :max_total_price, Integer, api_name: :maxTotalPrice

        # @!method initialize(max_shipping_price: nil, max_total_price: nil)
        #   @param max_shipping_price [Integer]
        #   @param max_total_price [Integer]
      end
    end
  end
end
