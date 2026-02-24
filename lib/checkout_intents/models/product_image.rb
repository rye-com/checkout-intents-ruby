# frozen_string_literal: true

module CheckoutIntents
  module Models
    class ProductImage < ::CheckoutIntents::Internal::Type::BaseModel
      # @!attribute is_featured
      #
      #   @return [Boolean]
      required :is_featured, ::CheckoutIntents::Internal::Type::Boolean, api_name: :isFeatured

      # @!attribute url
      #
      #   @return [String]
      required :url, String

      # @!method initialize(is_featured:, url:)
      #   @param is_featured [Boolean]
      #   @param url [String]
    end
  end
end
