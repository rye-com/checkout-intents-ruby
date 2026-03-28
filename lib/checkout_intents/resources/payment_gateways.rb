# frozen_string_literal: true

module CheckoutIntents
  module Resources
    class PaymentGateways
      # Create a payment gateway session for client-side card tokenization.
      #
      # Returns short-lived credentials scoped to the authenticated developer. Use the
      # credentials with the corresponding gateway's client-side SDK to tokenize a card.
      # Tokens created this way are locked to the developer's container and cannot be
      # used by other developers.
      #
      # @overload create_session(gateway, request_options: {})
      #
      # @param gateway [Symbol, ::CheckoutIntents::Models::PaymentGateway] The payment gateway to create a session for
      #
      # @param request_options [::CheckoutIntents::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [::CheckoutIntents::Models::PaymentGatewaySession]
      #
      # @see ::CheckoutIntents::Models::PaymentGatewayCreateSessionParams
      def create_session(gateway, params = {})
        @client.request(
          method: :post,
          path: ["api/v1/payment-gateways/%1$s/session", gateway],
          model: ::CheckoutIntents::PaymentGatewaySession,
          options: params[:request_options]
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
