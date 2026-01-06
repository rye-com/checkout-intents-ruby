# frozen_string_literal: true

module CheckoutIntents
  module Models
    # @see CheckoutIntents::Resources::Brands#retrieve
    class BrandRetrieveResponse < CheckoutIntents::Internal::Type::BaseModel
      # @!attribute id
      #   A unique identifier for the brand.
      #
      #   @return [String]
      required :id, String

      # @!attribute marketplace
      #   Indicates what ecommerce platform the brand uses.
      #
      #   @return [Symbol, CheckoutIntents::Models::BrandRetrieveResponse::Marketplace]
      required :marketplace, enum: -> { CheckoutIntents::Models::BrandRetrieveResponse::Marketplace }

      # @!attribute supported
      #   If `false`, then products from this brand cannot be purchased through the Sell
      #   Anything API.
      #
      #   @return [Boolean]
      required :supported, CheckoutIntents::Internal::Type::Boolean

      # @!method initialize(id:, marketplace:, supported:)
      #   Some parameter documentations has been truncated, see
      #   {CheckoutIntents::Models::BrandRetrieveResponse} for more details.
      #
      #   @param id [String] A unique identifier for the brand.
      #
      #   @param marketplace [Symbol, CheckoutIntents::Models::BrandRetrieveResponse::Marketplace] Indicates what ecommerce platform the brand uses.
      #
      #   @param supported [Boolean] If `false`, then products from this brand cannot be purchased through the

      # Indicates what ecommerce platform the brand uses.
      #
      # @see CheckoutIntents::Models::BrandRetrieveResponse#marketplace
      module Marketplace
        extend CheckoutIntents::Internal::Type::Enum

        AMAZON = :AMAZON
        SHOPIFY = :SHOPIFY
        BESTBUY = :BESTBUY
        UNKNOWN = :UNKNOWN

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
