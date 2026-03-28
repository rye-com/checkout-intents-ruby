# typed: strong

module CheckoutIntents
  module Models
    class PaymentGatewayCreateSessionParams < ::CheckoutIntents::Internal::Type::BaseModel
      extend ::CheckoutIntents::Internal::Type::RequestParameters::Converter
      include ::CheckoutIntents::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ::CheckoutIntents::PaymentGatewayCreateSessionParams,
            ::CheckoutIntents::Internal::AnyHash
          )
        end

      sig { returns(::CheckoutIntents::PaymentGateway::OrSymbol) }
      attr_accessor :gateway

      sig do
        params(
          gateway: ::CheckoutIntents::PaymentGateway::OrSymbol,
          request_options: ::CheckoutIntents::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(gateway:, request_options: {})
      end

      sig do
        override.returns(
          {
            gateway: ::CheckoutIntents::PaymentGateway::OrSymbol,
            request_options: ::CheckoutIntents::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
