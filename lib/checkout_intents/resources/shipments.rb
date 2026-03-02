# frozen_string_literal: true

module CheckoutIntents
  module Resources
    class Shipments
      # Retrieve a shipment by id
      #
      # Returns shipment information if the lookup succeeds.
      #
      # @overload retrieve(id, request_options: {})
      #
      # @param id [String] The id of the shipment to look up
      #
      # @param request_options [CheckoutIntents::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingShipped, CheckoutIntents::Models::Shipment::DeliveredShipment, CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingDelayed, CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingOutForDelivery, CheckoutIntents::Models::Shipment::WithStatusBaseShipmentOrdered, CheckoutIntents::Models::Shipment::WithStatusBaseShipmentCanceled]
      #
      # @see CheckoutIntents::Models::ShipmentRetrieveParams
      def retrieve(id, params = {})
        @client.request(
          method: :get,
          path: ["api/v1/shipments/%1$s", id],
          model: CheckoutIntents::Shipment,
          options: params[:request_options]
        )
      end

      # Retrieve a paginated list of shipments
      #
      # Enables developers to query shipments associated with their account, with
      # filters and cursor-based pagination.
      #
      # @overload list(after: nil, before: nil, ids: nil, limit: nil, status: nil, request_options: {})
      #
      # @param after [String]
      # @param before [String]
      # @param ids [Array<String>]
      # @param limit [Float]
      # @param status [Array<Symbol, CheckoutIntents::Models::ShipmentStatus>]
      # @param request_options [CheckoutIntents::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [CheckoutIntents::Internal::CursorPagination<CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingShipped, CheckoutIntents::Models::Shipment::DeliveredShipment, CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingDelayed, CheckoutIntents::Models::Shipment::WithStatusBaseShipmentWithTrackingOutForDelivery, CheckoutIntents::Models::Shipment::WithStatusBaseShipmentOrdered, CheckoutIntents::Models::Shipment::WithStatusBaseShipmentCanceled>]
      #
      # @see CheckoutIntents::Models::ShipmentListParams
      def list(params = {})
        parsed, options = CheckoutIntents::ShipmentListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "api/v1/shipments",
          query: parsed,
          page: CheckoutIntents::Internal::CursorPagination,
          model: CheckoutIntents::Shipment,
          options: options
        )
      end

      # @api private
      #
      # @param client [CheckoutIntents::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
