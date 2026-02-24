# typed: strong

module CheckoutIntents
  module Models
    class CheckoutIntentCreateParams < CheckoutIntents::Internal::Type::BaseModel
      extend CheckoutIntents::Internal::Type::RequestParameters::Converter
      include CheckoutIntents::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            CheckoutIntents::CheckoutIntentCreateParams,
            CheckoutIntents::Internal::AnyHash
          )
        end

      sig { returns(CheckoutIntents::Buyer) }
      attr_reader :buyer

      sig { params(buyer: CheckoutIntents::Buyer::OrHash).void }
      attr_writer :buyer

      sig { returns(String) }
      attr_accessor :product_url

      sig { returns(Integer) }
      attr_accessor :quantity

      sig do
        returns(
          T.nilable(CheckoutIntents::CheckoutIntentCreateParams::Constraints)
        )
      end
      attr_reader :constraints

      sig do
        params(
          constraints:
            CheckoutIntents::CheckoutIntentCreateParams::Constraints::OrHash
        ).void
      end
      attr_writer :constraints

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :discover_promo_codes

      sig { params(discover_promo_codes: T::Boolean).void }
      attr_writer :discover_promo_codes

      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :promo_codes

      sig { params(promo_codes: T::Array[String]).void }
      attr_writer :promo_codes

      sig { returns(T.nilable(T::Array[CheckoutIntents::VariantSelection])) }
      attr_reader :variant_selections

      sig do
        params(
          variant_selections:
            T::Array[CheckoutIntents::VariantSelection::OrHash]
        ).void
      end
      attr_writer :variant_selections

      sig do
        params(
          buyer: CheckoutIntents::Buyer::OrHash,
          product_url: String,
          quantity: Integer,
          constraints:
            CheckoutIntents::CheckoutIntentCreateParams::Constraints::OrHash,
          discover_promo_codes: T::Boolean,
          promo_codes: T::Array[String],
          variant_selections:
            T::Array[CheckoutIntents::VariantSelection::OrHash],
          request_options: CheckoutIntents::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        buyer:,
        product_url:,
        quantity:,
        constraints: nil,
        discover_promo_codes: nil,
        promo_codes: nil,
        variant_selections: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            buyer: CheckoutIntents::Buyer,
            product_url: String,
            quantity: Integer,
            constraints:
              CheckoutIntents::CheckoutIntentCreateParams::Constraints,
            discover_promo_codes: T::Boolean,
            promo_codes: T::Array[String],
            variant_selections: T::Array[CheckoutIntents::VariantSelection],
            request_options: CheckoutIntents::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Constraints < CheckoutIntents::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              CheckoutIntents::CheckoutIntentCreateParams::Constraints,
              CheckoutIntents::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(Integer)) }
        attr_reader :max_shipping_price

        sig { params(max_shipping_price: Integer).void }
        attr_writer :max_shipping_price

        sig { returns(T.nilable(Integer)) }
        attr_reader :max_total_price

        sig { params(max_total_price: Integer).void }
        attr_writer :max_total_price

        # Controls how much effort the system should spend retrieving an offer.
        #
        # - 'max': Full effort including AI agent fallback (slower, higher success rate)
        # - 'low': Fast API-only retrieval, fails if API unavailable (faster, lower
        #   success rate)
        #
        # Default: 'max'
        sig do
          returns(
            T.nilable(
              CheckoutIntents::CheckoutIntentCreateParams::Constraints::OfferRetrievalEffort::OrSymbol
            )
          )
        end
        attr_reader :offer_retrieval_effort

        sig do
          params(
            offer_retrieval_effort:
              CheckoutIntents::CheckoutIntentCreateParams::Constraints::OfferRetrievalEffort::OrSymbol
          ).void
        end
        attr_writer :offer_retrieval_effort

        sig do
          params(
            max_shipping_price: Integer,
            max_total_price: Integer,
            offer_retrieval_effort:
              CheckoutIntents::CheckoutIntentCreateParams::Constraints::OfferRetrievalEffort::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          max_shipping_price: nil,
          max_total_price: nil,
          # Controls how much effort the system should spend retrieving an offer.
          #
          # - 'max': Full effort including AI agent fallback (slower, higher success rate)
          # - 'low': Fast API-only retrieval, fails if API unavailable (faster, lower
          #   success rate)
          #
          # Default: 'max'
          offer_retrieval_effort: nil
        )
        end

        sig do
          override.returns(
            {
              max_shipping_price: Integer,
              max_total_price: Integer,
              offer_retrieval_effort:
                CheckoutIntents::CheckoutIntentCreateParams::Constraints::OfferRetrievalEffort::OrSymbol
            }
          )
        end
        def to_hash
        end

        # Controls how much effort the system should spend retrieving an offer.
        #
        # - 'max': Full effort including AI agent fallback (slower, higher success rate)
        # - 'low': Fast API-only retrieval, fails if API unavailable (faster, lower
        #   success rate)
        #
        # Default: 'max'
        module OfferRetrievalEffort
          extend CheckoutIntents::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                CheckoutIntents::CheckoutIntentCreateParams::Constraints::OfferRetrievalEffort
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MAX =
            T.let(
              :max,
              CheckoutIntents::CheckoutIntentCreateParams::Constraints::OfferRetrievalEffort::TaggedSymbol
            )
          LOW =
            T.let(
              :low,
              CheckoutIntents::CheckoutIntentCreateParams::Constraints::OfferRetrievalEffort::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                CheckoutIntents::CheckoutIntentCreateParams::Constraints::OfferRetrievalEffort::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
