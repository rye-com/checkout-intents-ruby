# frozen_string_literal: true

module CheckoutIntents
  module Models
    # @see CheckoutIntents::Resources::CheckoutIntents#add_payment
    class CheckoutIntentAddPaymentParams < CheckoutIntents::Internal::Type::BaseModel
      extend CheckoutIntents::Internal::Type::RequestParameters::Converter
      include CheckoutIntents::Internal::Type::RequestParameters

      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute payment_method
      #
      #   @return [CheckoutIntents::Models::PaymentMethod::StripeTokenPaymentMethod, CheckoutIntents::Models::PaymentMethod::BasisTheoryPaymentMethod, CheckoutIntents::Models::PaymentMethod::NekudaPaymentMethod, CheckoutIntents::Models::PaymentMethod::PravaPaymentMethod, CheckoutIntents::Models::PaymentMethod::DrawdownPaymentMethod]
      required :payment_method, union: -> { CheckoutIntents::PaymentMethod }, api_name: :paymentMethod

      # @!method initialize(id:, payment_method:, request_options: {})
      #   @param id [String]
      #   @param payment_method [CheckoutIntents::Models::PaymentMethod::StripeTokenPaymentMethod, CheckoutIntents::Models::PaymentMethod::BasisTheoryPaymentMethod, CheckoutIntents::Models::PaymentMethod::NekudaPaymentMethod, CheckoutIntents::Models::PaymentMethod::PravaPaymentMethod, CheckoutIntents::Models::PaymentMethod::DrawdownPaymentMethod]
      #   @param request_options [CheckoutIntents::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
