# frozen_string_literal: true

module CheckoutIntents
  module Models
    # @see ::CheckoutIntents::Resources::PaymentGateways#create_session
    class PaymentGatewayCreateSessionParams < ::CheckoutIntents::Internal::Type::BaseModel
      extend ::CheckoutIntents::Internal::Type::RequestParameters::Converter
      include ::CheckoutIntents::Internal::Type::RequestParameters

      # @!attribute gateway
      #
      #   @return [Symbol, ::CheckoutIntents::Models::PaymentGateway]
      required :gateway, enum: -> { ::CheckoutIntents::PaymentGateway }

      # @!method initialize(gateway:, request_options: {})
      #   @param gateway [Symbol, ::CheckoutIntents::Models::PaymentGateway]
      #   @param request_options [::CheckoutIntents::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
