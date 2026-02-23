# frozen_string_literal: true

module CheckoutIntents
  module Resources
    class CheckoutIntents
      # @return [CheckoutIntents::Resources::CheckoutIntents::Shipments]
      attr_reader :shipments

      # Create a checkout intent with the given request body.
      #
      # @overload create(buyer:, product_url:, quantity:, constraints: nil, discover_promo_codes: nil, promo_codes: nil, variant_selections: nil, request_options: {})
      #
      # @param buyer [::CheckoutIntents::Models::Buyer]
      # @param product_url [String]
      # @param quantity [Integer]
      # @param constraints [::CheckoutIntents::Models::CheckoutIntentCreateParams::Constraints]
      # @param discover_promo_codes [Boolean]
      # @param promo_codes [Array<String>]
      # @param variant_selections [Array<::CheckoutIntents::Models::VariantSelection>]
      # @param request_options [::CheckoutIntents::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [::CheckoutIntents::Models::CheckoutIntent::RetrievingOfferCheckoutIntent, ::CheckoutIntents::Models::CheckoutIntent::AwaitingConfirmationCheckoutIntent, ::CheckoutIntents::Models::CheckoutIntent::PlacingOrderCheckoutIntent, ::CheckoutIntents::Models::CheckoutIntent::CompletedCheckoutIntent, ::CheckoutIntents::Models::CheckoutIntent::FailedCheckoutIntent]
      #
      # @see ::CheckoutIntents::Models::CheckoutIntentCreateParams
      def create(params)
        parsed, options = ::CheckoutIntents::CheckoutIntentCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "api/v1/checkout-intents",
          body: parsed,
          model: ::CheckoutIntents::CheckoutIntent,
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
      # @param request_options [::CheckoutIntents::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [::CheckoutIntents::Models::CheckoutIntent::RetrievingOfferCheckoutIntent, ::CheckoutIntents::Models::CheckoutIntent::AwaitingConfirmationCheckoutIntent, ::CheckoutIntents::Models::CheckoutIntent::PlacingOrderCheckoutIntent, ::CheckoutIntents::Models::CheckoutIntent::CompletedCheckoutIntent, ::CheckoutIntents::Models::CheckoutIntent::FailedCheckoutIntent]
      #
      # @see ::CheckoutIntents::Models::CheckoutIntentRetrieveParams
      def retrieve(id, params = {})
        @client.request(
          method: :get,
          path: ["api/v1/checkout-intents/%1$s", id],
          model: ::CheckoutIntents::CheckoutIntent,
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
      # @param state [Array<Symbol, ::CheckoutIntents::Models::CheckoutIntentListParams::State>]
      # @param request_options [::CheckoutIntents::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [::CheckoutIntents::Internal::CursorPagination<::CheckoutIntents::Models::CheckoutIntent::RetrievingOfferCheckoutIntent, ::CheckoutIntents::Models::CheckoutIntent::AwaitingConfirmationCheckoutIntent, ::CheckoutIntents::Models::CheckoutIntent::PlacingOrderCheckoutIntent, ::CheckoutIntents::Models::CheckoutIntent::CompletedCheckoutIntent, ::CheckoutIntents::Models::CheckoutIntent::FailedCheckoutIntent>]
      #
      # @see ::CheckoutIntents::Models::CheckoutIntentListParams
      def list(params = {})
        parsed, options = ::CheckoutIntents::CheckoutIntentListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "api/v1/checkout-intents",
          query: parsed,
          page: ::CheckoutIntents::Internal::CursorPagination,
          model: ::CheckoutIntents::CheckoutIntent,
          options: options
        )
      end

      # Add payment details to a checkout intent
      #
      # @overload add_payment(id, payment_method:, request_options: {})
      #
      # @param id [String] The id of the checkout intent to add payment details to
      #
      # @param payment_method [::CheckoutIntents::Models::PaymentMethod::StripeTokenPaymentMethod, ::CheckoutIntents::Models::PaymentMethod::BasisTheoryPaymentMethod, ::CheckoutIntents::Models::PaymentMethod::NekudaPaymentMethod, ::CheckoutIntents::Models::PaymentMethod::PravaPaymentMethod, ::CheckoutIntents::Models::PaymentMethod::DrawdownPaymentMethod]
      #
      # @param request_options [::CheckoutIntents::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [::CheckoutIntents::Models::CheckoutIntent::RetrievingOfferCheckoutIntent, ::CheckoutIntents::Models::CheckoutIntent::AwaitingConfirmationCheckoutIntent, ::CheckoutIntents::Models::CheckoutIntent::PlacingOrderCheckoutIntent, ::CheckoutIntents::Models::CheckoutIntent::CompletedCheckoutIntent, ::CheckoutIntents::Models::CheckoutIntent::FailedCheckoutIntent]
      #
      # @see ::CheckoutIntents::Models::CheckoutIntentAddPaymentParams
      def add_payment(id, params)
        parsed, options = ::CheckoutIntents::CheckoutIntentAddPaymentParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["api/v1/checkout-intents/%1$s/payment", id],
          body: parsed,
          model: ::CheckoutIntents::CheckoutIntent,
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
      # @param payment_method [::CheckoutIntents::Models::PaymentMethod::StripeTokenPaymentMethod, ::CheckoutIntents::Models::PaymentMethod::BasisTheoryPaymentMethod, ::CheckoutIntents::Models::PaymentMethod::NekudaPaymentMethod, ::CheckoutIntents::Models::PaymentMethod::PravaPaymentMethod, ::CheckoutIntents::Models::PaymentMethod::DrawdownPaymentMethod]
      #
      # @param request_options [::CheckoutIntents::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [::CheckoutIntents::Models::CheckoutIntent::RetrievingOfferCheckoutIntent, ::CheckoutIntents::Models::CheckoutIntent::AwaitingConfirmationCheckoutIntent, ::CheckoutIntents::Models::CheckoutIntent::PlacingOrderCheckoutIntent, ::CheckoutIntents::Models::CheckoutIntent::CompletedCheckoutIntent, ::CheckoutIntents::Models::CheckoutIntent::FailedCheckoutIntent]
      #
      # @see ::CheckoutIntents::Models::CheckoutIntentConfirmParams
      def confirm(id, params)
        parsed, options = ::CheckoutIntents::CheckoutIntentConfirmParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["api/v1/checkout-intents/%1$s/confirm", id],
          body: parsed,
          model: ::CheckoutIntents::CheckoutIntent,
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
      # @param buyer [::CheckoutIntents::Models::Buyer]
      # @param payment_method [::CheckoutIntents::Models::PaymentMethod::StripeTokenPaymentMethod, ::CheckoutIntents::Models::PaymentMethod::BasisTheoryPaymentMethod, ::CheckoutIntents::Models::PaymentMethod::NekudaPaymentMethod, ::CheckoutIntents::Models::PaymentMethod::PravaPaymentMethod, ::CheckoutIntents::Models::PaymentMethod::DrawdownPaymentMethod]
      # @param product_url [String]
      # @param quantity [Integer]
      # @param constraints [::CheckoutIntents::Models::CheckoutIntentPurchaseParams::Constraints]
      # @param discover_promo_codes [Boolean]
      # @param promo_codes [Array<String>]
      # @param variant_selections [Array<::CheckoutIntents::Models::VariantSelection>]
      # @param request_options [::CheckoutIntents::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [::CheckoutIntents::Models::CheckoutIntent::RetrievingOfferCheckoutIntent, ::CheckoutIntents::Models::CheckoutIntent::AwaitingConfirmationCheckoutIntent, ::CheckoutIntents::Models::CheckoutIntent::PlacingOrderCheckoutIntent, ::CheckoutIntents::Models::CheckoutIntent::CompletedCheckoutIntent, ::CheckoutIntents::Models::CheckoutIntent::FailedCheckoutIntent]
      #
      # @see ::CheckoutIntents::Models::CheckoutIntentPurchaseParams
      def purchase(params)
        parsed, options = ::CheckoutIntents::CheckoutIntentPurchaseParams.dump_request(params)
        @client.request(
          method: :post,
          path: "api/v1/checkout-intents/purchase",
          body: parsed,
          model: ::CheckoutIntents::CheckoutIntent,
          options: options
        )
      end

      # Poll a checkout intent until it reaches a completed state (completed or failed).
      #
      # @param id [String] The checkout intent ID to poll
      # @param poll_interval [Float] Seconds between polling attempts (default: 5.0)
      # @param max_attempts [Integer] Maximum polling attempts before timeout (default: 120)
      # @param request_options [::CheckoutIntents::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [::CheckoutIntents::Models::CheckoutIntent::CompletedCheckoutIntent, ::CheckoutIntents::Models::CheckoutIntent::FailedCheckoutIntent]
      #
      # @raise [::CheckoutIntents::Errors::PollTimeoutError] If max attempts reached without reaching terminal state
      #
      # @example
      #   intent = client.checkout_intents.poll_until_completed("ci_123")
      #   if intent.state == :completed
      #     puts "Order placed successfully!"
      #   else
      #     puts "Order failed: #{intent.failure_reason.message}"
      #   end
      def poll_until_completed(
        id,
        poll_interval: Helpers::Polling::DEFAULT_POLL_INTERVAL,
        max_attempts: Helpers::Polling::DEFAULT_MAX_ATTEMPTS,
        request_options: {}
      )
        Helpers::Polling.poll_until(
          @client,
          id,
          Helpers::Polling::COMPLETED,
          poll_interval: poll_interval,
          max_attempts: max_attempts,
          request_options: request_options
        )
      end

      # Poll a checkout intent until it's ready for confirmation (awaiting_confirmation or failed).
      #
      # This is typically used after creating a checkout intent to wait for the offer
      # to be retrieved from the merchant. The intent can reach awaiting_confirmation
      # (success - ready to confirm) or failed (offer retrieval failed).
      #
      # @param id [String] The checkout intent ID to poll
      # @param poll_interval [Float] Seconds between polling attempts (default: 5.0)
      # @param max_attempts [Integer] Maximum polling attempts before timeout (default: 120)
      # @param request_options [::CheckoutIntents::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [::CheckoutIntents::Models::CheckoutIntent::AwaitingConfirmationCheckoutIntent, ::CheckoutIntents::Models::CheckoutIntent::FailedCheckoutIntent]
      #
      # @raise [::CheckoutIntents::Errors::PollTimeoutError] If max attempts reached without reaching target state
      #
      # @example
      #   intent = client.checkout_intents.poll_until_awaiting_confirmation("ci_123")
      #   if intent.state == :awaiting_confirmation
      #     puts "Total: #{intent.offer.cost.total}"
      #   else
      #     puts "Failed: #{intent.failure_reason.message}"
      #   end
      def poll_until_awaiting_confirmation(
        id,
        poll_interval: Helpers::Polling::DEFAULT_POLL_INTERVAL,
        max_attempts: Helpers::Polling::DEFAULT_MAX_ATTEMPTS,
        request_options: {}
      )
        Helpers::Polling.poll_until(
          @client,
          id,
          Helpers::Polling::AWAITING_CONFIRMATION,
          poll_interval: poll_interval,
          max_attempts: max_attempts,
          request_options: request_options
        )
      end

      # Create a checkout intent and poll until it's ready for confirmation.
      #
      # This follows the Rye documented flow: create -> poll until awaiting_confirmation.
      # After this method completes, you should review the offer (pricing, shipping, taxes)
      # with the user before calling confirm().
      #
      # @overload create_and_poll(buyer:, product_url:, quantity:, constraints: nil, promo_codes: nil, variant_selections: nil, poll_interval: 5.0, max_attempts: 120, request_options: {})
      #
      # @param buyer [::CheckoutIntents::Models::Buyer]
      # @param product_url [String]
      # @param quantity [Integer]
      # @param constraints [::CheckoutIntents::Models::CheckoutIntentCreateParams::Constraints]
      # @param promo_codes [Array<String>]
      # @param variant_selections [Array<::CheckoutIntents::Models::VariantSelection>]
      # @param poll_interval [Float] Seconds between polling attempts (default: 5.0)
      # @param max_attempts [Integer] Maximum polling attempts before timeout (default: 120)
      # @param request_options [::CheckoutIntents::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [::CheckoutIntents::Models::CheckoutIntent::AwaitingConfirmationCheckoutIntent, ::CheckoutIntents::Models::CheckoutIntent::FailedCheckoutIntent]
      #
      # @raise [::CheckoutIntents::Errors::PollTimeoutError] If max attempts reached without reaching target state
      #
      # @example
      #   intent = client.checkout_intents.create_and_poll(
      #     buyer: { address1: "123 Main St", city: "New York", ... },
      #     product_url: "https://example.com/product",
      #     quantity: 1
      #   )
      #   puts "Total: #{intent.offer.cost.total}"
      def create_and_poll(
        buyer:,
        product_url:,
        quantity:,
        constraints: nil,
        promo_codes: nil,
        variant_selections: nil,
        poll_interval: Helpers::Polling::DEFAULT_POLL_INTERVAL,
        max_attempts: Helpers::Polling::DEFAULT_MAX_ATTEMPTS,
        request_options: {}
      )
        create_params = {
          buyer: buyer,
          product_url: product_url,
          quantity: quantity,
          request_options: request_options
        }
        create_params[:constraints] = constraints if constraints
        create_params[:promo_codes] = promo_codes if promo_codes
        create_params[:variant_selections] = variant_selections if variant_selections

        intent = create(create_params)
        poll_until_awaiting_confirmation(
          intent.id,
          poll_interval: poll_interval,
          max_attempts: max_attempts,
          request_options: request_options
        )
      end

      # Confirm a checkout intent and poll until it reaches a completed state (completed or failed).
      #
      # @overload confirm_and_poll(id, payment_method:, poll_interval: 5.0, max_attempts: 120, request_options: {})
      #
      # @param id [String] The id of the checkout intent to confirm
      # @param payment_method [::CheckoutIntents::Models::PaymentMethod::StripeTokenPaymentMethod, ::CheckoutIntents::Models::PaymentMethod::BasisTheoryPaymentMethod, ::CheckoutIntents::Models::PaymentMethod::NekudaPaymentMethod]
      # @param poll_interval [Float] Seconds between polling attempts (default: 5.0)
      # @param max_attempts [Integer] Maximum polling attempts before timeout (default: 120)
      # @param request_options [::CheckoutIntents::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [::CheckoutIntents::Models::CheckoutIntent::CompletedCheckoutIntent, ::CheckoutIntents::Models::CheckoutIntent::FailedCheckoutIntent]
      #
      # @raise [::CheckoutIntents::Errors::PollTimeoutError] If max attempts reached without reaching terminal state
      #
      # @example
      #   intent = client.checkout_intents.confirm_and_poll(
      #     "ci_123",
      #     payment_method: { type: "stripe_token", stripe_token: "tok_visa" }
      #   )
      #   if intent.state == :completed
      #     puts "Order placed successfully!"
      #   else
      #     puts "Order failed: #{intent.failure_reason.message}"
      #   end
      def confirm_and_poll(
        id,
        payment_method:,
        poll_interval: Helpers::Polling::DEFAULT_POLL_INTERVAL,
        max_attempts: Helpers::Polling::DEFAULT_MAX_ATTEMPTS,
        request_options: {}
      )
        intent = confirm(id, payment_method: payment_method, request_options: request_options)
        poll_until_completed(
          intent.id,
          poll_interval: poll_interval,
          max_attempts: max_attempts,
          request_options: request_options
        )
      end

      # @api private
      #
      # @param client [::CheckoutIntents::Client]
      def initialize(client:)
        @client = client
        @shipments = CheckoutIntents::Resources::CheckoutIntents::Shipments.new(client: client)
      end
    end
  end
end
