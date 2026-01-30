# typed: strong

module CheckoutIntents
  module Models
    class Product < CheckoutIntents::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(CheckoutIntents::Product, CheckoutIntents::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :id

      # The availability status of a product.
      #
      # - `in_stock`: Product is available for immediate purchase
      # - `out_of_stock`: Product is currently unavailable
      # - `preorder`: Product is available for pre-order before release
      # - `backorder`: Product is temporarily out of stock but can be ordered
      # - `unknown`: Availability could not be determined
      sig { returns(CheckoutIntents::ProductAvailability::TaggedSymbol) }
      attr_accessor :availability

      sig { returns(T.nilable(String)) }
      attr_accessor :brand

      sig { returns(T.nilable(String)) }
      attr_accessor :description

      sig { returns(T::Array[CheckoutIntents::ProductImage]) }
      attr_accessor :images

      sig { returns(String) }
      attr_accessor :name

      sig { returns(CheckoutIntents::Money) }
      attr_reader :price

      sig { params(price: CheckoutIntents::Money::OrHash).void }
      attr_writer :price

      sig { returns(T.nilable(String)) }
      attr_accessor :sku

      sig { returns(String) }
      attr_accessor :url

      sig do
        params(
          id: String,
          availability: CheckoutIntents::ProductAvailability::OrSymbol,
          brand: T.nilable(String),
          description: T.nilable(String),
          images: T::Array[CheckoutIntents::ProductImage::OrHash],
          name: String,
          price: CheckoutIntents::Money::OrHash,
          sku: T.nilable(String),
          url: String
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        # The availability status of a product.
        #
        # - `in_stock`: Product is available for immediate purchase
        # - `out_of_stock`: Product is currently unavailable
        # - `preorder`: Product is available for pre-order before release
        # - `backorder`: Product is temporarily out of stock but can be ordered
        # - `unknown`: Availability could not be determined
        availability:,
        brand:,
        description:,
        images:,
        name:,
        price:,
        sku:,
        url:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            availability: CheckoutIntents::ProductAvailability::TaggedSymbol,
            brand: T.nilable(String),
            description: T.nilable(String),
            images: T::Array[CheckoutIntents::ProductImage],
            name: String,
            price: CheckoutIntents::Money,
            sku: T.nilable(String),
            url: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
