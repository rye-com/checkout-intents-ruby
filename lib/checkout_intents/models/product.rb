# frozen_string_literal: true

module CheckoutIntents
  module Models
    # @see ::CheckoutIntents::Resources::Products#lookup
    class Product < ::CheckoutIntents::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute availability
      #   The availability status of a product.
      #
      #   - `in_stock`: Product is available for immediate purchase
      #   - `out_of_stock`: Product is currently unavailable
      #   - `preorder`: Product is available for pre-order before release
      #   - `backorder`: Product is temporarily out of stock but can be ordered
      #   - `unknown`: Availability could not be determined
      #
      #   @return [Symbol, ::CheckoutIntents::Models::ProductAvailability]
      required :availability, enum: -> { ::CheckoutIntents::ProductAvailability }

      # @!attribute brand
      #
      #   @return [String, nil]
      required :brand, String, nil?: true

      # @!attribute description
      #
      #   @return [String, nil]
      required :description, String, nil?: true

      # @!attribute images
      #
      #   @return [Array<::CheckoutIntents::Models::ProductImage>]
      required :images, -> { ::CheckoutIntents::Internal::Type::ArrayOf[::CheckoutIntents::ProductImage] }

      # @!attribute is_purchasable
      #
      #   @return [Boolean]
      required :is_purchasable, ::CheckoutIntents::Internal::Type::Boolean, api_name: :isPurchasable

      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute price
      #
      #   @return [::CheckoutIntents::Models::Money]
      required :price, -> { ::CheckoutIntents::Money }

      # @!attribute sku
      #
      #   @return [String, nil]
      required :sku, String, nil?: true

      # @!attribute url
      #
      #   @return [String]
      required :url, String

      # @!method initialize(id:, availability:, brand:, description:, images:, is_purchasable:, name:, price:, sku:, url:)
      #   Some parameter documentations has been truncated, see
      #   {::CheckoutIntents::Models::Product} for more details.
      #
      #   @param id [String]
      #
      #   @param availability [Symbol, ::CheckoutIntents::Models::ProductAvailability] The availability status of a product.
      #
      #   @param brand [String, nil]
      #
      #   @param description [String, nil]
      #
      #   @param images [Array<::CheckoutIntents::Models::ProductImage>]
      #
      #   @param is_purchasable [Boolean]
      #
      #   @param name [String]
      #
      #   @param price [::CheckoutIntents::Models::Money]
      #
      #   @param sku [String, nil]
      #
      #   @param url [String]
    end
  end
end
