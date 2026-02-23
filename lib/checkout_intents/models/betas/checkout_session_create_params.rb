# frozen_string_literal: true

module CheckoutIntents
  module Models
    module Betas
      # @see CheckoutIntents::Resources::Betas::CheckoutSessions#create
      class CheckoutSessionCreateParams < CheckoutIntents::Internal::Type::BaseModel
        extend CheckoutIntents::Internal::Type::RequestParameters::Converter
        include CheckoutIntents::Internal::Type::RequestParameters

        # @!attribute product_url
        #
        #   @return [String]
        required :product_url, String, api_name: :productUrl

        # @!attribute quantity
        #
        #   @return [Integer]
        required :quantity, Integer

        # @!attribute buyer
        #   Optional buyer information, used to pre-fill the checkout form with the buyer's
        #   information.
        #
        #   @return [CheckoutIntents::Models::Betas::CheckoutSessionCreateParams::Buyer, nil]
        optional :buyer, -> { CheckoutIntents::Betas::CheckoutSessionCreateParams::Buyer }

        # @!attribute constraints
        #
        #   @return [CheckoutIntents::Models::Betas::CheckoutSessionCreateParams::Constraints, nil]
        optional :constraints, -> { CheckoutIntents::Betas::CheckoutSessionCreateParams::Constraints }

        # @!attribute discover_promo_codes
        #
        #   @return [Boolean, nil]
        optional :discover_promo_codes,
                 CheckoutIntents::Internal::Type::Boolean,
                 api_name: :discoverPromoCodes

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

        # @!method initialize(product_url:, quantity:, buyer: nil, constraints: nil, discover_promo_codes: nil, promo_codes: nil, variant_selections: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {CheckoutIntents::Models::Betas::CheckoutSessionCreateParams} for more details.
        #
        #   @param product_url [String]
        #
        #   @param quantity [Integer]
        #
        #   @param buyer [CheckoutIntents::Models::Betas::CheckoutSessionCreateParams::Buyer] Optional buyer information, used to pre-fill the checkout form with the buyer's
        #
        #   @param constraints [CheckoutIntents::Models::Betas::CheckoutSessionCreateParams::Constraints]
        #
        #   @param discover_promo_codes [Boolean]
        #
        #   @param promo_codes [Array<String>]
        #
        #   @param variant_selections [Array<CheckoutIntents::Models::VariantSelection>]
        #
        #   @param request_options [CheckoutIntents::RequestOptions, Hash{Symbol=>Object}]

        class Buyer < CheckoutIntents::Internal::Type::BaseModel
          # @!attribute address1
          #
          #   @return [String, nil]
          optional :address1, String

          # @!attribute address2
          #
          #   @return [String, nil]
          optional :address2, String

          # @!attribute city
          #
          #   @return [String, nil]
          optional :city, String

          # @!attribute country
          #
          #   @return [String, nil]
          optional :country, String

          # @!attribute email
          #
          #   @return [String, nil]
          optional :email, String

          # @!attribute first_name
          #
          #   @return [String, nil]
          optional :first_name, String, api_name: :firstName

          # @!attribute last_name
          #
          #   @return [String, nil]
          optional :last_name, String, api_name: :lastName

          # @!attribute phone
          #
          #   @return [String, nil]
          optional :phone, String

          # @!attribute postal_code
          #
          #   @return [String, nil]
          optional :postal_code, String, api_name: :postalCode

          # @!attribute province
          #
          #   @return [String, nil]
          optional :province, String

          # @!method initialize(address1: nil, address2: nil, city: nil, country: nil, email: nil, first_name: nil, last_name: nil, phone: nil, postal_code: nil, province: nil)
          #   Optional buyer information, used to pre-fill the checkout form with the buyer's
          #   information.
          #
          #   @param address1 [String]
          #   @param address2 [String]
          #   @param city [String]
          #   @param country [String]
          #   @param email [String]
          #   @param first_name [String]
          #   @param last_name [String]
          #   @param phone [String]
          #   @param postal_code [String]
          #   @param province [String]
        end

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
          #   @return [Symbol, CheckoutIntents::Models::Betas::CheckoutSessionCreateParams::Constraints::OfferRetrievalEffort, nil]
          optional :offer_retrieval_effort,
                   enum: -> {
                     CheckoutIntents::Betas::CheckoutSessionCreateParams::Constraints::OfferRetrievalEffort
                   },
                   api_name: :offerRetrievalEffort

          # @!method initialize(max_shipping_price: nil, max_total_price: nil, offer_retrieval_effort: nil)
          #   Some parameter documentations has been truncated, see
          #   {CheckoutIntents::Models::Betas::CheckoutSessionCreateParams::Constraints} for
          #   more details.
          #
          #   @param max_shipping_price [Integer]
          #
          #   @param max_total_price [Integer]
          #
          #   @param offer_retrieval_effort [Symbol, CheckoutIntents::Models::Betas::CheckoutSessionCreateParams::Constraints::OfferRetrievalEffort] Controls how much effort the system should spend retrieving an offer.

          # Controls how much effort the system should spend retrieving an offer.
          #
          # - 'max': Full effort including AI agent fallback (slower, higher success rate)
          # - 'low': Fast API-only retrieval, fails if API unavailable (faster, lower
          #   success rate)
          #
          # Default: 'max'
          #
          # @see CheckoutIntents::Models::Betas::CheckoutSessionCreateParams::Constraints#offer_retrieval_effort
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
end
