# typed: strong

module CheckoutIntents
  module Resources
    class PaymentGateways
      # Create a payment gateway session for client-side card tokenization.
      #
      # Returns short-lived credentials scoped to the authenticated developer. Use the
      # credentials with the corresponding gateway's client-side SDK to tokenize a card.
      # Tokens created this way are locked to the developer's container and cannot be
      # used by other developers.
      sig do
        params(
          gateway: ::CheckoutIntents::PaymentGateway::OrSymbol,
          request_options: ::CheckoutIntents::RequestOptions::OrHash
        ).returns(::CheckoutIntents::PaymentGatewaySession)
      end
      def create_session(
        # The payment gateway to create a session for
        gateway,
        request_options: {}
      )
      end

      # @api private
      sig do
        params(client: ::CheckoutIntents::Client).returns(T.attached_class)
      end
      def self.new(client:)
      end
    end
  end
end
