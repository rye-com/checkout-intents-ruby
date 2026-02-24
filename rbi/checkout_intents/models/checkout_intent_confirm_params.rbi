# typed: strong

module CheckoutIntents
  module Models
    class CheckoutIntentConfirmParams < ::CheckoutIntents::Internal::Type::BaseModel
      extend ::CheckoutIntents::Internal::Type::RequestParameters::Converter
      include ::CheckoutIntents::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ::CheckoutIntents::CheckoutIntentConfirmParams,
            ::CheckoutIntents::Internal::AnyHash
          )
        end

      sig do
        returns(
          T.any(
            ::CheckoutIntents::PaymentMethod::StripeTokenPaymentMethod,
            ::CheckoutIntents::PaymentMethod::BasisTheoryPaymentMethod,
            ::CheckoutIntents::PaymentMethod::NekudaPaymentMethod,
            ::CheckoutIntents::PaymentMethod::PravaPaymentMethod,
            ::CheckoutIntents::PaymentMethod::DrawdownPaymentMethod
          )
        )
      end
      attr_accessor :payment_method

      sig do
        params(
          payment_method:
            T.any(
              ::CheckoutIntents::PaymentMethod::StripeTokenPaymentMethod::OrHash,
              ::CheckoutIntents::PaymentMethod::BasisTheoryPaymentMethod::OrHash,
              ::CheckoutIntents::PaymentMethod::NekudaPaymentMethod::OrHash,
              ::CheckoutIntents::PaymentMethod::PravaPaymentMethod::OrHash,
              ::CheckoutIntents::PaymentMethod::DrawdownPaymentMethod::OrHash
            ),
          request_options: ::CheckoutIntents::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(payment_method:, request_options: {})
      end

      sig do
        override.returns(
          {
            payment_method:
              T.any(
                ::CheckoutIntents::PaymentMethod::StripeTokenPaymentMethod,
                ::CheckoutIntents::PaymentMethod::BasisTheoryPaymentMethod,
                ::CheckoutIntents::PaymentMethod::NekudaPaymentMethod,
                ::CheckoutIntents::PaymentMethod::PravaPaymentMethod,
                ::CheckoutIntents::PaymentMethod::DrawdownPaymentMethod
              ),
            request_options: ::CheckoutIntents::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
