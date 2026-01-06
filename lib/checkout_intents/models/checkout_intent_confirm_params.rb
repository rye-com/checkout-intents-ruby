# frozen_string_literal: true

module CheckoutIntents
  module Models
    # @see CheckoutIntents::Resources::CheckoutIntents#confirm
    class CheckoutIntentConfirmParams < CheckoutIntents::Internal::Type::BaseModel
      extend CheckoutIntents::Internal::Type::RequestParameters::Converter
      include CheckoutIntents::Internal::Type::RequestParameters

      # @!attribute payment_method
      #
      #   @return [CheckoutIntents::Models::PaymentMethod::StripeTokenPaymentMethod, CheckoutIntents::Models::PaymentMethod::BasisTheoryPaymentMethod, CheckoutIntents::Models::PaymentMethod::NekudaPaymentMethod]
      required :payment_method, union: -> { CheckoutIntents::PaymentMethod }, api_name: :paymentMethod

      # @!method initialize(payment_method:, request_options: {})
      #   @param payment_method [CheckoutIntents::Models::PaymentMethod::StripeTokenPaymentMethod, CheckoutIntents::Models::PaymentMethod::BasisTheoryPaymentMethod, CheckoutIntents::Models::PaymentMethod::NekudaPaymentMethod]
      #   @param request_options [CheckoutIntents::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
