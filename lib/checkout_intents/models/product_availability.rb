# frozen_string_literal: true

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
      extend ::CheckoutIntents::Internal::Type::Enum

      IN_STOCK = :in_stock
      OUT_OF_STOCK = :out_of_stock
      PREORDER = :preorder
      BACKORDER = :backorder
      UNKNOWN = :unknown

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
