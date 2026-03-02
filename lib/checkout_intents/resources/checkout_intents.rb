# frozen_string_literal: true

module CheckoutIntents
  module Resources
    class CheckoutIntents
      # Create a checkout intent with the given request body.
      #
      # @overload create(buyer:, product_url:, quantity:, constraints: nil, discover_promo_codes: nil, promo_codes: nil, variant_selections: nil, request_options: {})
      #
      # @param buyer [CheckoutIntents::Models::Buyer]
      # @param product_url [String]
      # @param quantity [Integer]
      # @param constraints [CheckoutIntents::Models::CheckoutIntentCreateParams::Constraints]
      # @param discover_promo_codes [Boolean]
      # @param promo_codes [Array<String>]
      # @param variant_selections [Array<CheckoutIntents::Models::VariantSelection>]
      # @param request_options [CheckoutIntents::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [CheckoutIntents::Models::CheckoutIntent::RetrievingOfferCheckoutIntent, CheckoutIntents::Models::CheckoutIntent::AwaitingConfirmationCheckoutIntent, CheckoutIntents::Models::CheckoutIntent::PlacingOrderCheckoutIntent, CheckoutIntents::Models::CheckoutIntent::CompletedCheckoutIntent, CheckoutIntents::Models::CheckoutIntent::FailedCheckoutIntent]
      #
      # @see CheckoutIntents::Models::CheckoutIntentCreateParams
      def create(params)
        parsed, options = CheckoutIntents::CheckoutIntentCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "api/v1/checkout-intents",
          body: parsed,
          model: CheckoutIntents::CheckoutIntent,
          options: options
        )
      end

      # Retrieve a checkout intent by id
      #
      # Returns checkout intent information if the lookup succeeds.
      #
      # @overload retrieve(id, request_options: {})
      #
      # @param id [String] The id of the checkout intent to look up
      #
      # @param request_options [CheckoutIntents::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [CheckoutIntents::Models::CheckoutIntent::RetrievingOfferCheckoutIntent, CheckoutIntents::Models::CheckoutIntent::AwaitingConfirmationCheckoutIntent, CheckoutIntents::Models::CheckoutIntent::PlacingOrderCheckoutIntent, CheckoutIntents::Models::CheckoutIntent::CompletedCheckoutIntent, CheckoutIntents::Models::CheckoutIntent::FailedCheckoutIntent]
      #
      # @see CheckoutIntents::Models::CheckoutIntentRetrieveParams
      def retrieve(id, params = {})
        @client.request(
          method: :get,
          path: ["api/v1/checkout-intents/%1$s", id],
          model: CheckoutIntents::CheckoutIntent,
          options: params[:request_options]
        )
      end

      # Retrieve a paginated list of checkout intents
      #
      # Enables developers to query checkout intents associated with their account, with
      # filters and cursor-based pagination.
      #
      # @overload list(id: nil, after: nil, before: nil, limit: nil, state: nil, request_options: {})
      #
      # @param id [Array<String>]
      # @param after [String]
      # @param before [String]
      # @param limit [Float]
      # @param state [Array<Symbol, CheckoutIntents::Models::CheckoutIntentListParams::State>]
      # @param request_options [CheckoutIntents::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [CheckoutIntents::Internal::CursorPagination<CheckoutIntents::Models::CheckoutIntent::RetrievingOfferCheckoutIntent, CheckoutIntents::Models::CheckoutIntent::AwaitingConfirmationCheckoutIntent, CheckoutIntents::Models::CheckoutIntent::PlacingOrderCheckoutIntent, CheckoutIntents::Models::CheckoutIntent::CompletedCheckoutIntent, CheckoutIntents::Models::CheckoutIntent::FailedCheckoutIntent>]
      #
      # @see CheckoutIntents::Models::CheckoutIntentListParams
      def list(params = {})
        parsed, options = CheckoutIntents::CheckoutIntentListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "api/v1/checkout-intents",
          query: parsed,
          page: CheckoutIntents::Internal::CursorPagination,
          model: CheckoutIntents::CheckoutIntent,
          options: options
        )
      end

      # Add payment details to a checkout intent
      #
      # @overload add_payment(id, payment_method:, request_options: {})
      #
      # @param id [String] The id of the checkout intent to add payment details to
      #
      # @param payment_method [CheckoutIntents::Models::PaymentMethod::StripeTokenPaymentMethod, CheckoutIntents::Models::PaymentMethod::BasisTheoryPaymentMethod, CheckoutIntents::Models::PaymentMethod::NekudaPaymentMethod, CheckoutIntents::Models::PaymentMethod::PravaPaymentMethod, CheckoutIntents::Models::PaymentMethod::DrawdownPaymentMethod]
      #
      # @param request_options [CheckoutIntents::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [CheckoutIntents::Models::CheckoutIntent::RetrievingOfferCheckoutIntent, CheckoutIntents::Models::CheckoutIntent::AwaitingConfirmationCheckoutIntent, CheckoutIntents::Models::CheckoutIntent::PlacingOrderCheckoutIntent, CheckoutIntents::Models::CheckoutIntent::CompletedCheckoutIntent, CheckoutIntents::Models::CheckoutIntent::FailedCheckoutIntent]
      #
      # @see CheckoutIntents::Models::CheckoutIntentAddPaymentParams
      def add_payment(id, params)
        parsed, options = CheckoutIntents::CheckoutIntentAddPaymentParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["api/v1/checkout-intents/%1$s/payment", id],
          body: parsed,
          model: CheckoutIntents::CheckoutIntent,
          options: options
        )
      end

      # Confirm a checkout intent with provided payment information
      #
      # Confirm means we have buyer's name, address and payment info, so we can move
      # forward to place the order.
      #
      # @overload confirm(id, payment_method:, request_options: {})
      #
      # @param id [String] The id of the checkout intent to confirm
      #
      # @param payment_method [CheckoutIntents::Models::PaymentMethod::StripeTokenPaymentMethod, CheckoutIntents::Models::PaymentMethod::BasisTheoryPaymentMethod, CheckoutIntents::Models::PaymentMethod::NekudaPaymentMethod, CheckoutIntents::Models::PaymentMethod::PravaPaymentMethod, CheckoutIntents::Models::PaymentMethod::DrawdownPaymentMethod]
      #
      # @param request_options [CheckoutIntents::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [CheckoutIntents::Models::CheckoutIntent::RetrievingOfferCheckoutIntent, CheckoutIntents::Models::CheckoutIntent::AwaitingConfirmationCheckoutIntent, CheckoutIntents::Models::CheckoutIntent::PlacingOrderCheckoutIntent, CheckoutIntents::Models::CheckoutIntent::CompletedCheckoutIntent, CheckoutIntents::Models::CheckoutIntent::FailedCheckoutIntent]
      #
      # @see CheckoutIntents::Models::CheckoutIntentConfirmParams
      def confirm(id, params)
        parsed, options = CheckoutIntents::CheckoutIntentConfirmParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["api/v1/checkout-intents/%1$s/confirm", id],
          body: parsed,
          model: CheckoutIntents::CheckoutIntent,
          options: options
        )
      end

      # Create a checkout intent and immediately trigger the purchase workflow.
      #
      # This is a "fire-and-forget" endpoint that combines create + confirm in one step.
      # The workflow handles offer retrieval, payment authorization, and order placement
      # asynchronously. Poll the GET endpoint to check status.
      #
      # @overload purchase(buyer:, payment_method:, product_url:, quantity:, constraints: nil, discover_promo_codes: nil, promo_codes: nil, variant_selections: nil, request_options: {})
      #
      # @param buyer [CheckoutIntents::Models::Buyer]
      # @param payment_method [CheckoutIntents::Models::PaymentMethod::StripeTokenPaymentMethod, CheckoutIntents::Models::PaymentMethod::BasisTheoryPaymentMethod, CheckoutIntents::Models::PaymentMethod::NekudaPaymentMethod, CheckoutIntents::Models::PaymentMethod::PravaPaymentMethod, CheckoutIntents::Models::PaymentMethod::DrawdownPaymentMethod]
      # @param product_url [String]
      # @param quantity [Integer]
      # @param constraints [CheckoutIntents::Models::CheckoutIntentPurchaseParams::Constraints]
      # @param discover_promo_codes [Boolean]
      # @param promo_codes [Array<String>]
      # @param variant_selections [Array<CheckoutIntents::Models::VariantSelection>]
      # @param request_options [CheckoutIntents::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [CheckoutIntents::Models::CheckoutIntent::RetrievingOfferCheckoutIntent, CheckoutIntents::Models::CheckoutIntent::AwaitingConfirmationCheckoutIntent, CheckoutIntents::Models::CheckoutIntent::PlacingOrderCheckoutIntent, CheckoutIntents::Models::CheckoutIntent::CompletedCheckoutIntent, CheckoutIntents::Models::CheckoutIntent::FailedCheckoutIntent]
      #
      # @see CheckoutIntents::Models::CheckoutIntentPurchaseParams
      def purchase(params)
        parsed, options = CheckoutIntents::CheckoutIntentPurchaseParams.dump_request(params)
        @client.request(
          method: :post,
          path: "api/v1/checkout-intents/purchase",
          body: parsed,
          model: CheckoutIntents::CheckoutIntent,
          options: options
        )
      end

      # @api private
      #
      # @param client [CheckoutIntents::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
