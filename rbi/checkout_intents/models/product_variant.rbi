# typed: strong

module CheckoutIntents
  module Models
    class ProductVariant < ::CheckoutIntents::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ::CheckoutIntents::ProductVariant,
            ::CheckoutIntents::Internal::AnyHash
          )
        end

      # The availability status of a product.
      #
      # - `in_stock`: Product is available for immediate purchase
      # - `out_of_stock`: Product is currently unavailable
      # - `preorder`: Product is available for pre-order before release
      # - `backorder`: Product is temporarily out of stock but can be ordered
      # - `unknown`: Availability could not be determined
      sig { returns(::CheckoutIntents::ProductAvailability::TaggedSymbol) }
      attr_accessor :availability

      sig { returns(T::Array[::CheckoutIntents::VariantSelection]) }
      attr_accessor :dimensions

      sig { returns(T::Array[::CheckoutIntents::ProductImage]) }
      attr_accessor :images

      sig { returns(T.nilable(String)) }
      attr_accessor :name

      sig { returns(::CheckoutIntents::Money) }
      attr_reader :price

      sig { params(price: ::CheckoutIntents::Money::OrHash).void }
      attr_writer :price

      sig { returns(T.nilable(String)) }
      attr_accessor :sku

      sig do
        params(
          availability: ::CheckoutIntents::ProductAvailability::OrSymbol,
          dimensions: T::Array[::CheckoutIntents::VariantSelection::OrHash],
          images: T::Array[::CheckoutIntents::ProductImage::OrHash],
          name: T.nilable(String),
          price: ::CheckoutIntents::Money::OrHash,
          sku: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # The availability status of a product.
        #
        # - `in_stock`: Product is available for immediate purchase
        # - `out_of_stock`: Product is currently unavailable
        # - `preorder`: Product is available for pre-order before release
        # - `backorder`: Product is temporarily out of stock but can be ordered
        # - `unknown`: Availability could not be determined
        availability:,
        dimensions:,
        images:,
        name:,
        price:,
        sku:
      )
      end

      sig do
        override.returns(
          {
            availability: ::CheckoutIntents::ProductAvailability::TaggedSymbol,
            dimensions: T::Array[::CheckoutIntents::VariantSelection],
            images: T::Array[::CheckoutIntents::ProductImage],
            name: T.nilable(String),
            price: ::CheckoutIntents::Money,
            sku: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
