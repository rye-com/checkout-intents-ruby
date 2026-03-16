# frozen_string_literal: true

module CheckoutIntents
  module Resources
    class CheckoutIntents
      class Shipments
        # List shipments for a checkout intent
        #
        # @overload list(id, after: nil, before: nil, limit: nil, request_options: {})
        #
        # @param id [String] The id of the checkout intent
        #
        # @param after [String]
        #
        # @param before [String]
        #
        # @param limit [Integer] Maximum number of results to return (default 100)
        #
        # @param request_options [::CheckoutIntents::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [::CheckoutIntents::Internal::CursorPagination<::CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingShipped, ::CheckoutIntents::Models::Shipment::DeliveredShipment, ::CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingDelayed, ::CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingOutForDelivery, ::CheckoutIntents::Models::Shipment::WithStatusBaseShipmentOrdered, ::CheckoutIntents::Models::Shipment::WithStatusBaseShipmentCanceled>]
        #
        # @see ::CheckoutIntents::Models::CheckoutIntents::ShipmentListParams
        def list(id, params = {})
          parsed, options = ::CheckoutIntents::CheckoutIntents::ShipmentListParams.dump_request(params)
          query = ::CheckoutIntents::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["api/v1/checkout-intents/%1$s/shipments", id],
            query: query,
            page: ::CheckoutIntents::Internal::CursorPagination,
            model: ::CheckoutIntents::Shipment,
            options: options
          )
        end

        # @api private
        #
        # @param client [::CheckoutIntents::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
