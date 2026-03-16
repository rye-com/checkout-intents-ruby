# typed: strong

module CheckoutIntents
  module Models
    class BrandRetrieveResponse < ::CheckoutIntents::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ::CheckoutIntents::Models::BrandRetrieveResponse,
            ::CheckoutIntents::Internal::AnyHash
          )
        end

      # A unique identifier for the brand.
      sig { returns(String) }
      attr_accessor :id

      # Indicates what ecommerce platform the brand uses.
      sig do
        returns(
          ::CheckoutIntents::Models::BrandRetrieveResponse::Marketplace::TaggedSymbol
        )
      end
      attr_accessor :marketplace

      # If `false`, then products from this brand cannot be purchased through the Sell
      # Anything API.
      sig { returns(T::Boolean) }
      attr_accessor :supported

      sig do
        params(
          id: String,
          marketplace:
            ::CheckoutIntents::Models::BrandRetrieveResponse::Marketplace::OrSymbol,
          supported: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # A unique identifier for the brand.
        id:,
        # Indicates what ecommerce platform the brand uses.
        marketplace:,
        # If `false`, then products from this brand cannot be purchased through the Sell
        # Anything API.
        supported:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            marketplace:
              ::CheckoutIntents::Models::BrandRetrieveResponse::Marketplace::TaggedSymbol,
            supported: T::Boolean
          }
        )
      end
      def to_hash
      end

      # Indicates what ecommerce platform the brand uses.
      module Marketplace
        extend ::CheckoutIntents::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              ::CheckoutIntents::Models::BrandRetrieveResponse::Marketplace
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AMAZON =
          T.let(
            :AMAZON,
            ::CheckoutIntents::Models::BrandRetrieveResponse::Marketplace::TaggedSymbol
          )
        SHOPIFY =
          T.let(
            :SHOPIFY,
            ::CheckoutIntents::Models::BrandRetrieveResponse::Marketplace::TaggedSymbol
          )
        BESTBUY =
          T.let(
            :BESTBUY,
            ::CheckoutIntents::Models::BrandRetrieveResponse::Marketplace::TaggedSymbol
          )
        UNKNOWN =
          T.let(
            :UNKNOWN,
            ::CheckoutIntents::Models::BrandRetrieveResponse::Marketplace::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ::CheckoutIntents::Models::BrandRetrieveResponse::Marketplace::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
