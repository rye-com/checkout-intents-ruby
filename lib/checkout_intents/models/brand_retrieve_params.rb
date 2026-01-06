# frozen_string_literal: true

module CheckoutIntents
  module Models
    # @see CheckoutIntents::Resources::Brands#retrieve
    class BrandRetrieveParams < CheckoutIntents::Internal::Type::BaseModel
      extend CheckoutIntents::Internal::Type::RequestParameters::Converter
      include CheckoutIntents::Internal::Type::RequestParameters

      # @!method initialize(request_options: {})
      #   @param request_options [CheckoutIntents::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
