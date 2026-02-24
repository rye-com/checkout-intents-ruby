# frozen_string_literal: true

module CheckoutIntents
  module Models
    module CheckoutIntents
      # @see ::CheckoutIntents::Resources::CheckoutIntents::Shipments#list
      class ShipmentListParams < ::CheckoutIntents::Internal::Type::BaseModel
        extend ::CheckoutIntents::Internal::Type::RequestParameters::Converter
        include ::CheckoutIntents::Internal::Type::RequestParameters

        # @!attribute after
        #
        #   @return [String, nil]
        optional :after, String

        # @!attribute before
        #
        #   @return [String, nil]
        optional :before, String

        # @!attribute limit
        #
        #   @return [Float, nil]
        optional :limit, Float

        # @!method initialize(after: nil, before: nil, limit: nil, request_options: {})
        #   @param after [String]
        #   @param before [String]
        #   @param limit [Float]
        #   @param request_options [::CheckoutIntents::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
