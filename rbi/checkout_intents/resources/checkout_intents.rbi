# typed: strong

module CheckoutIntents
  module Resources
    class CheckoutIntents
      sig { returns(CheckoutIntents::Resources::CheckoutIntents::Shipments) }
      attr_reader :shipments

      # Create a checkout intent with the given request body.
      sig do
        params(
          buyer: CheckoutIntents::Buyer::OrHash,
          product_url: String,
          quantity: Integer,
          constraints:
            CheckoutIntents::CheckoutIntentCreateParams::Constraints::OrHash,
          promo_codes: T::Array[String],
          variant_selections:
            T::Array[CheckoutIntents::VariantSelection::OrHash],
          request_options: CheckoutIntents::RequestOptions::OrHash
        ).returns(CheckoutIntents::CheckoutIntent::Variants)
      end
      def create(
        buyer:,
        product_url:,
        quantity:,
        constraints: nil,
        promo_codes: nil,
        variant_selections: nil,
        request_options: {}
      )
      end

      # Retrieve a checkout intent by id
      #
      # Returns checkout intent information if the lookup succeeds.
      sig do
        params(
          id: String,
          request_options: CheckoutIntents::RequestOptions::OrHash
        ).returns(CheckoutIntents::CheckoutIntent::Variants)
      end
      def retrieve(
        # The id of the checkout intent to look up
        id,
        request_options: {}
      )
      end

      # Retrieve a paginated list of checkout intents
      #
      # Enables developers to query checkout intents associated with their account, with
      # filters and cursor-based pagination.
      sig do
        params(
          id: T::Array[String],
          after: String,
          before: String,
          limit: Float,
          state:
            T::Array[
              CheckoutIntents::CheckoutIntentListParams::State::OrSymbol
            ],
          request_options: CheckoutIntents::RequestOptions::OrHash
        ).returns(
          CheckoutIntents::Internal::CursorPagination[
            CheckoutIntents::CheckoutIntent::Variants
          ]
        )
      end
      def list(
        id: nil,
        after: nil,
        before: nil,
        limit: nil,
        state: nil,
        request_options: {}
      )
      end

      # Add payment details to a checkout intent
      sig do
        params(
          id: String,
          payment_method:
            T.any(
              CheckoutIntents::PaymentMethod::StripeTokenPaymentMethod::OrHash,
              CheckoutIntents::PaymentMethod::BasisTheoryPaymentMethod::OrHash,
              CheckoutIntents::PaymentMethod::NekudaPaymentMethod::OrHash,
              CheckoutIntents::PaymentMethod::DrawdownPaymentMethod::OrHash
            ),
          request_options: CheckoutIntents::RequestOptions::OrHash
        ).returns(CheckoutIntents::CheckoutIntent::Variants)
      end
      def add_payment(
        # The id of the checkout intent to add payment details to
        id,
        payment_method:,
        request_options: {}
      )
      end

      # Confirm a checkout intent with provided payment information
      #
      # Confirm means we have buyer's name, address and payment info, so we can move
      # forward to place the order.
      sig do
        params(
          id: String,
          payment_method:
            T.any(
              CheckoutIntents::PaymentMethod::StripeTokenPaymentMethod::OrHash,
              CheckoutIntents::PaymentMethod::BasisTheoryPaymentMethod::OrHash,
              CheckoutIntents::PaymentMethod::NekudaPaymentMethod::OrHash,
              CheckoutIntents::PaymentMethod::DrawdownPaymentMethod::OrHash
            ),
          request_options: CheckoutIntents::RequestOptions::OrHash
        ).returns(CheckoutIntents::CheckoutIntent::Variants)
      end
      def confirm(
        # The id of the checkout intent to confirm
        id,
        payment_method:,
        request_options: {}
      )
      end

      # Create a checkout intent and immediately trigger the purchase workflow.
      #
      # This is a "fire-and-forget" endpoint that combines create + confirm in one step.
      # The workflow handles offer retrieval, payment authorization, and order placement
      # asynchronously. Poll the GET endpoint to check status.
      sig do
        params(
          buyer: CheckoutIntents::Buyer::OrHash,
          payment_method:
            T.any(
              CheckoutIntents::PaymentMethod::StripeTokenPaymentMethod::OrHash,
              CheckoutIntents::PaymentMethod::BasisTheoryPaymentMethod::OrHash,
              CheckoutIntents::PaymentMethod::NekudaPaymentMethod::OrHash,
              CheckoutIntents::PaymentMethod::DrawdownPaymentMethod::OrHash
            ),
          product_url: String,
          quantity: Integer,
          constraints:
            CheckoutIntents::CheckoutIntentPurchaseParams::Constraints::OrHash,
          promo_codes: T::Array[String],
          variant_selections:
            T::Array[CheckoutIntents::VariantSelection::OrHash],
          request_options: CheckoutIntents::RequestOptions::OrHash
        ).returns(CheckoutIntents::CheckoutIntent::Variants)
      end
      def purchase(
        buyer:,
        payment_method:,
        product_url:,
        quantity:,
        constraints: nil,
        promo_codes: nil,
        variant_selections: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: CheckoutIntents::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
