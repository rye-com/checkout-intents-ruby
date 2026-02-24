# frozen_string_literal: true

module CheckoutIntents
  module Models
    class BaseCheckoutIntent < CheckoutIntents::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute buyer
      #
      #   @return [CheckoutIntents::Models::Buyer]
      required :buyer, -> { CheckoutIntents::Buyer }

      # @!attribute created_at
      #
      #   @return [Time]
      required :created_at, Time, api_name: :createdAt

      # @!attribute product_url
      #
      #   @return [String]
      required :product_url, String, api_name: :productUrl

      # @!attribute quantity
      #
      #   @return [Integer]
      required :quantity, Integer

      # @!attribute constraints
      #
      #   @return [CheckoutIntents::Models::BaseCheckoutIntent::Constraints, nil]
      optional :constraints, -> { CheckoutIntents::BaseCheckoutIntent::Constraints }

      # @!attribute discover_promo_codes
      #
      #   @return [Boolean, nil]
      optional :discover_promo_codes, CheckoutIntents::Internal::Type::Boolean, api_name: :discoverPromoCodes

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

      # @!method initialize(id:, buyer:, created_at:, product_url:, quantity:, constraints: nil, discover_promo_codes: nil, promo_codes: nil, variant_selections: nil)
      #   @param id [String]
      #   @param buyer [CheckoutIntents::Models::Buyer]
      #   @param created_at [Time]
      #   @param product_url [String]
      #   @param quantity [Integer]
      #   @param constraints [CheckoutIntents::Models::BaseCheckoutIntent::Constraints]
      #   @param discover_promo_codes [Boolean]
      #   @param promo_codes [Array<String>]
      #   @param variant_selections [Array<CheckoutIntents::Models::VariantSelection>]

      # @see CheckoutIntents::Models::BaseCheckoutIntent#constraints
      class Constraints < CheckoutIntents::Internal::Type::BaseModel
        # @!attribute max_shipping_price
        #
        #   @return [Integer, nil]
        optional :max_shipping_price, Integer, api_name: :maxShippingPrice

        # @!attribute max_total_price
        #
        #   @return [Integer, nil]
        optional :max_total_price, Integer, api_name: :maxTotalPrice

        # @!attribute offer_retrieval_effort
        #   Controls how much effort the system should spend retrieving an offer.
        #
        #   - 'max': Full effort including AI agent fallback (slower, higher success rate)
        #   - 'low': Fast API-only retrieval, fails if API unavailable (faster, lower
        #     success rate)
        #
        #   Default: 'max'
        #
        #   @return [Symbol, CheckoutIntents::Models::BaseCheckoutIntent::Constraints::OfferRetrievalEffort, nil]
        optional :offer_retrieval_effort,
                 enum: -> { CheckoutIntents::BaseCheckoutIntent::Constraints::OfferRetrievalEffort },
                 api_name: :offerRetrievalEffort

        # @!method initialize(max_shipping_price: nil, max_total_price: nil, offer_retrieval_effort: nil)
        #   Some parameter documentations has been truncated, see
        #   {CheckoutIntents::Models::BaseCheckoutIntent::Constraints} for more details.
        #
        #   @param max_shipping_price [Integer]
        #
        #   @param max_total_price [Integer]
        #
        #   @param offer_retrieval_effort [Symbol, CheckoutIntents::Models::BaseCheckoutIntent::Constraints::OfferRetrievalEffort] Controls how much effort the system should spend retrieving an offer.

        # Controls how much effort the system should spend retrieving an offer.
        #
        # - 'max': Full effort including AI agent fallback (slower, higher success rate)
        # - 'low': Fast API-only retrieval, fails if API unavailable (faster, lower
        #   success rate)
        #
        # Default: 'max'
        #
        # @see CheckoutIntents::Models::BaseCheckoutIntent::Constraints#offer_retrieval_effort
        module OfferRetrievalEffort
          extend CheckoutIntents::Internal::Type::Enum

          MAX = :max
          LOW = :low

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
