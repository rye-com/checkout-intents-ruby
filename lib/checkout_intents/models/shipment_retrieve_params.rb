# frozen_string_literal: true

module CheckoutIntents
  module Models
    # @see ::CheckoutIntents::Resources::Shipments#retrieve
    class ShipmentRetrieveParams < ::CheckoutIntents::Internal::Type::BaseModel
      extend ::CheckoutIntents::Internal::Type::RequestParameters::Converter
      include ::CheckoutIntents::Internal::Type::RequestParameters

      # @!method initialize(request_options: {})
      #   @param request_options [::CheckoutIntents::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
