# typed: strong

module CheckoutIntents
  module Resources
    class CheckoutIntents
      class Shipments
        # List shipments for a checkout intent
        sig do
          params(
            id: String,
            after: String,
            before: String,
            limit: Integer,
            request_options: CheckoutIntents::RequestOptions::OrHash
          ).returns(
            CheckoutIntents::Internal::CursorPagination[
              CheckoutIntents::Shipment::Variants
            ]
          )
        end
        def list(
          # The id of the checkout intent
          id,
          after: nil,
          before: nil,
          # Maximum number of results to return (default 100)
          limit: nil,
          request_options: {}
        )
        end

        # @api private
        sig do
          params(client: CheckoutIntents::Client).returns(T.attached_class)
        end
        def self.new(client:)
        end
      end
    end
  end
end
