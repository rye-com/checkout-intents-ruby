# frozen_string_literal: true

module CheckoutIntents
  module Models
    # @see ::CheckoutIntents::Resources::PaymentGateways#create_session
    class PaymentGatewaySession < ::CheckoutIntents::Internal::Type::BaseModel
      # @!attribute container
      #
      #   @return [String]
      required :container, String

      # @!attribute gateway
      #
      #   @return [Symbol, ::CheckoutIntents::Models::PaymentGatewaySession::Gateway]
      required :gateway, enum: -> { ::CheckoutIntents::PaymentGatewaySession::Gateway }

      # @!attribute session_key
      #
      #   @return [String]
      required :session_key, String, api_name: :sessionKey

      # @!method initialize(container:, gateway:, session_key:)
      #   @param container [String]
      #   @param gateway [Symbol, ::CheckoutIntents::Models::PaymentGatewaySession::Gateway]
      #   @param session_key [String]

      # @see ::CheckoutIntents::Models::PaymentGatewaySession#gateway
      module Gateway
        extend ::CheckoutIntents::Internal::Type::Enum

        BASIS_THEORY = :basis_theory

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
