# typed: strong

module CheckoutIntents
  module Models
    # The availability status of a product.
    #
    # - `in_stock`: Product is available for immediate purchase
    # - `out_of_stock`: Product is currently unavailable
    # - `preorder`: Product is available for pre-order before release
    # - `backorder`: Product is temporarily out of stock but can be ordered
    # - `unknown`: Availability could not be determined
    module ProductAvailability
      extend CheckoutIntents::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, CheckoutIntents::ProductAvailability) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      IN_STOCK =
        T.let(:in_stock, CheckoutIntents::ProductAvailability::TaggedSymbol)
      OUT_OF_STOCK =
        T.let(:out_of_stock, CheckoutIntents::ProductAvailability::TaggedSymbol)
      PREORDER =
        T.let(:preorder, CheckoutIntents::ProductAvailability::TaggedSymbol)
      BACKORDER =
        T.let(:backorder, CheckoutIntents::ProductAvailability::TaggedSymbol)
      UNKNOWN =
        T.let(:unknown, CheckoutIntents::ProductAvailability::TaggedSymbol)

      sig do
        override.returns(
          T::Array[CheckoutIntents::ProductAvailability::TaggedSymbol]
        )
      end
      def self.values
      end
    end
  end
end
