# frozen_string_literal: true

module CheckoutIntents
  module Models
    # @see ::CheckoutIntents::Resources::Brands#retrieve
    class BrandRetrieveParams < ::CheckoutIntents::Internal::Type::BaseModel
      extend ::CheckoutIntents::Internal::Type::RequestParameters::Converter
      include ::CheckoutIntents::Internal::Type::RequestParameters

      # @!attribute domain
      #   Represents a valid domain name string.
      #
      #   @return [String]
      required :domain, String

      # @!method initialize(domain:, request_options: {})
      #   @param domain [String] Represents a valid domain name string.
      #
      #   @param request_options [::CheckoutIntents::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
