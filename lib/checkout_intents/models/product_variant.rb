# frozen_string_literal: true

module CheckoutIntents
  module Models
    class ProductVariant < CheckoutIntents::Internal::Type::BaseModel
      # @!attribute availability
      #   The availability status of a product.
      #
      #   - `in_stock`: Product is available for immediate purchase
      #   - `out_of_stock`: Product is currently unavailable
      #   - `preorder`: Product is available for pre-order before release
      #   - `backorder`: Product is temporarily out of stock but can be ordered
      #   - `unknown`: Availability could not be determined
      #
      #   @return [Symbol, CheckoutIntents::Models::ProductAvailability]
      required :availability, enum: -> { CheckoutIntents::ProductAvailability }

      # @!attribute dimensions
      #
      #   @return [Array<CheckoutIntents::Models::VariantSelection>]
      required :dimensions, -> { CheckoutIntents::Internal::Type::ArrayOf[CheckoutIntents::VariantSelection] }

      # @!attribute images
      #
      #   @return [Array<CheckoutIntents::Models::ProductImage>]
      required :images, -> { CheckoutIntents::Internal::Type::ArrayOf[CheckoutIntents::ProductImage] }

      # @!attribute name
      #
      #   @return [String, nil]
      required :name, String, nil?: true

      # @!attribute price
      #
      #   @return [CheckoutIntents::Models::Money]
      required :price, -> { CheckoutIntents::Money }

      # @!attribute sku
      #
      #   @return [String, nil]
      required :sku, String, nil?: true

      # @!method initialize(availability:, dimensions:, images:, name:, price:, sku:)
      #   Some parameter documentations has been truncated, see
      #   {CheckoutIntents::Models::ProductVariant} for more details.
      #
      #   @param availability [Symbol, CheckoutIntents::Models::ProductAvailability] The availability status of a product.
      #
      #   @param dimensions [Array<CheckoutIntents::Models::VariantSelection>]
      #
      #   @param images [Array<CheckoutIntents::Models::ProductImage>]
      #
      #   @param name [String, nil]
      #
      #   @param price [CheckoutIntents::Models::Money]
      #
      #   @param sku [String, nil]
    end
  end
end
