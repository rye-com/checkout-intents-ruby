# typed: strong

module CheckoutIntents
  module Resources
    class Shipments
      # Retrieve a shipment by id
      #
      # Returns shipment information if the lookup succeeds.
      sig do
        params(
          id: String,
          request_options: CheckoutIntents::RequestOptions::OrHash
        ).returns(CheckoutIntents::Shipment::Variants)
      end
      def retrieve(
        # The id of the shipment to look up
        id,
        request_options: {}
      )
      end

      # Retrieve a paginated list of shipments
      #
      # Enables developers to query shipments associated with their account, with
      # filters and cursor-based pagination.
      sig do
        params(
          after: String,
          before: String,
          ids: T::Array[String],
          limit: Float,
          status: T::Array[CheckoutIntents::ShipmentStatus::OrSymbol],
          request_options: CheckoutIntents::RequestOptions::OrHash
        ).returns(
          CheckoutIntents::Internal::CursorPagination[
            CheckoutIntents::Shipment::Variants
          ]
        )
      end
      def list(
        after: nil,
        before: nil,
        ids: nil,
        limit: nil,
        status: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: CheckoutIntents::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
