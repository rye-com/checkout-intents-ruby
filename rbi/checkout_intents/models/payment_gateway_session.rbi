# typed: strong

module CheckoutIntents
  module Models
    class PaymentGatewaySession < ::CheckoutIntents::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ::CheckoutIntents::PaymentGatewaySession,
            ::CheckoutIntents::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :container

      sig do
        returns(::CheckoutIntents::PaymentGatewaySession::Gateway::TaggedSymbol)
      end
      attr_accessor :gateway

      sig { returns(String) }
      attr_accessor :session_key

      sig do
        params(
          container: String,
          gateway: ::CheckoutIntents::PaymentGatewaySession::Gateway::OrSymbol,
          session_key: String
        ).returns(T.attached_class)
      end
      def self.new(container:, gateway:, session_key:)
      end

      sig do
        override.returns(
          {
            container: String,
            gateway:
              ::CheckoutIntents::PaymentGatewaySession::Gateway::TaggedSymbol,
            session_key: String
          }
        )
      end
      def to_hash
      end

      module Gateway
        extend ::CheckoutIntents::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ::CheckoutIntents::PaymentGatewaySession::Gateway)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        BASIS_THEORY =
          T.let(
            :basis_theory,
            ::CheckoutIntents::PaymentGatewaySession::Gateway::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ::CheckoutIntents::PaymentGatewaySession::Gateway::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
