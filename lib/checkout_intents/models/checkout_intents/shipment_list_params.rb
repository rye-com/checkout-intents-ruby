# frozen_string_literal: true

module CheckoutIntents
  module Models
    module CheckoutIntents
      # @see CheckoutIntents::Resources::CheckoutIntents::Shipments#list
      class ShipmentListParams < ::CheckoutIntents::Internal::Type::BaseModel
        extend ::CheckoutIntents::Internal::Type::RequestParameters::Converter
        include ::CheckoutIntents::Internal::Type::RequestParameters

        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute after
        #
        #   @return [String, nil]
        optional :after, String

        # @!attribute before
        #
        #   @return [String, nil]
        optional :before, String

        # @!attribute limit
        #   Maximum number of results to return (default 100)
        #
        #   @return [Integer, nil]
        optional :limit, Integer

        # @!method initialize(id:, after: nil, before: nil, limit: nil, request_options: {})
        #   @param id [String]
        #
        #   @param after [String]
        #
        #   @param before [String]
        #
        #   @param limit [Integer] Maximum number of results to return (default 100)
        #
        #   @param request_options [CheckoutIntents::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
