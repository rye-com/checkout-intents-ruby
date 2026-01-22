# frozen_string_literal: true

module CheckoutIntents
  module Models
    # @see CheckoutIntents::Resources::CheckoutIntents#purchase
    class CheckoutIntentPurchaseParams < CheckoutIntents::Internal::Type::BaseModel
      extend CheckoutIntents::Internal::Type::RequestParameters::Converter
      include CheckoutIntents::Internal::Type::RequestParameters

      # @!attribute buyer
      #
      #   @return [CheckoutIntents::Models::Buyer]
      required :buyer, -> { CheckoutIntents::Buyer }

      # @!attribute payment_method
      #
      #   @return [CheckoutIntents::Models::PaymentMethod::StripeTokenPaymentMethod, CheckoutIntents::Models::PaymentMethod::BasisTheoryPaymentMethod, CheckoutIntents::Models::PaymentMethod::NekudaPaymentMethod]
      required :payment_method, union: -> { CheckoutIntents::PaymentMethod }, api_name: :paymentMethod

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
      #   @return [CheckoutIntents::Models::CheckoutIntentPurchaseParams::Constraints, nil]
      optional :constraints, -> { CheckoutIntents::CheckoutIntentPurchaseParams::Constraints }

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

      # @!method initialize(buyer:, payment_method:, product_url:, quantity:, constraints: nil, promo_codes: nil, variant_selections: nil, request_options: {})
      #   @param buyer [CheckoutIntents::Models::Buyer]
      #   @param payment_method [CheckoutIntents::Models::PaymentMethod::StripeTokenPaymentMethod, CheckoutIntents::Models::PaymentMethod::BasisTheoryPaymentMethod, CheckoutIntents::Models::PaymentMethod::NekudaPaymentMethod]
      #   @param product_url [String]
      #   @param quantity [Integer]
      #   @param constraints [CheckoutIntents::Models::CheckoutIntentPurchaseParams::Constraints]
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

        # @!attribute offer_retrieval_effort
        #   Controls how much effort the system should spend retrieving an offer.
        #
        #   - 'max': Full effort including AI agent fallback (slower, higher success rate)
        #   - 'low': Fast API-only retrieval, fails if API unavailable (faster, lower
        #     success rate)
        #
        #   Default: 'max'
        #
        #   @return [Symbol, CheckoutIntents::Models::CheckoutIntentPurchaseParams::Constraints::OfferRetrievalEffort, nil]
        optional :offer_retrieval_effort,
                 enum: -> {
                   CheckoutIntents::CheckoutIntentPurchaseParams::Constraints::OfferRetrievalEffort
                 },
                 api_name: :offerRetrievalEffort

        # @!method initialize(max_shipping_price: nil, max_total_price: nil, offer_retrieval_effort: nil)
        #   Some parameter documentations has been truncated, see
        #   {CheckoutIntents::Models::CheckoutIntentPurchaseParams::Constraints} for more
        #   details.
        #
        #   @param max_shipping_price [Integer]
        #
        #   @param max_total_price [Integer]
        #
        #   @param offer_retrieval_effort [Symbol, CheckoutIntents::Models::CheckoutIntentPurchaseParams::Constraints::OfferRetrievalEffort] Controls how much effort the system should spend retrieving an offer.

        # Controls how much effort the system should spend retrieving an offer.
        #
        # - 'max': Full effort including AI agent fallback (slower, higher success rate)
        # - 'low': Fast API-only retrieval, fails if API unavailable (faster, lower
        #   success rate)
        #
        # Default: 'max'
        #
        # @see CheckoutIntents::Models::CheckoutIntentPurchaseParams::Constraints#offer_retrieval_effort
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
