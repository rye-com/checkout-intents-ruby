# frozen_string_literal: true

module CheckoutIntents
  module Models
    # @see ::CheckoutIntents::Resources::CheckoutIntents#create
    module CheckoutIntent
      extend ::CheckoutIntents::Internal::Type::Union

      variant -> { ::CheckoutIntents::CheckoutIntent::RetrievingOfferCheckoutIntent }

      variant -> { ::CheckoutIntents::CheckoutIntent::AwaitingConfirmationCheckoutIntent }

      variant -> { ::CheckoutIntents::CheckoutIntent::PlacingOrderCheckoutIntent }

      variant -> { ::CheckoutIntents::CheckoutIntent::CompletedCheckoutIntent }

      variant -> { ::CheckoutIntents::CheckoutIntent::FailedCheckoutIntent }

      class RetrievingOfferCheckoutIntent < ::CheckoutIntents::Models::BaseCheckoutIntent
        # @!attribute state
        #
        #   @return [Symbol, ::CheckoutIntents::Models::CheckoutIntent::RetrievingOfferCheckoutIntent::State]
        required :state, enum: -> { ::CheckoutIntents::CheckoutIntent::RetrievingOfferCheckoutIntent::State }

        # @!method initialize(state:)
        #   @param state [Symbol, ::CheckoutIntents::Models::CheckoutIntent::RetrievingOfferCheckoutIntent::State]

        module State
          extend ::CheckoutIntents::Internal::Type::Enum

          RETRIEVING_OFFER = :retrieving_offer

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class AwaitingConfirmationCheckoutIntent < ::CheckoutIntents::Models::BaseCheckoutIntent
        # @!attribute offer
        #
        #   @return [::CheckoutIntents::Models::Offer]
        required :offer, -> { ::CheckoutIntents::Offer }

        # @!attribute state
        #
        #   @return [Symbol, ::CheckoutIntents::Models::CheckoutIntent::AwaitingConfirmationCheckoutIntent::State]
        required :state, enum: -> { ::CheckoutIntents::CheckoutIntent::AwaitingConfirmationCheckoutIntent::State }

        # @!attribute payment_method
        #
        #   @return [::CheckoutIntents::Models::PaymentMethod::StripeTokenPaymentMethod, ::CheckoutIntents::Models::PaymentMethod::BasisTheoryPaymentMethod, ::CheckoutIntents::Models::PaymentMethod::NekudaPaymentMethod, ::CheckoutIntents::Models::PaymentMethod::PravaPaymentMethod, ::CheckoutIntents::Models::PaymentMethod::DrawdownPaymentMethod, nil]
        optional :payment_method, union: -> { ::CheckoutIntents::PaymentMethod }, api_name: :paymentMethod

        # @!method initialize(offer:, state:, payment_method: nil)
        #   @param offer [::CheckoutIntents::Models::Offer]
        #   @param state [Symbol, ::CheckoutIntents::Models::CheckoutIntent::AwaitingConfirmationCheckoutIntent::State]
        #   @param payment_method [::CheckoutIntents::Models::PaymentMethod::StripeTokenPaymentMethod, ::CheckoutIntents::Models::PaymentMethod::BasisTheoryPaymentMethod, ::CheckoutIntents::Models::PaymentMethod::NekudaPaymentMethod, ::CheckoutIntents::Models::PaymentMethod::PravaPaymentMethod, ::CheckoutIntents::Models::PaymentMethod::DrawdownPaymentMethod]

        module State
          extend ::CheckoutIntents::Internal::Type::Enum

          AWAITING_CONFIRMATION = :awaiting_confirmation

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class PlacingOrderCheckoutIntent < ::CheckoutIntents::Models::BaseCheckoutIntent
        # @!attribute offer
        #
        #   @return [::CheckoutIntents::Models::Offer]
        required :offer, -> { ::CheckoutIntents::Offer }

        # @!attribute payment_method
        #
        #   @return [::CheckoutIntents::Models::PaymentMethod::StripeTokenPaymentMethod, ::CheckoutIntents::Models::PaymentMethod::BasisTheoryPaymentMethod, ::CheckoutIntents::Models::PaymentMethod::NekudaPaymentMethod, ::CheckoutIntents::Models::PaymentMethod::PravaPaymentMethod, ::CheckoutIntents::Models::PaymentMethod::DrawdownPaymentMethod]
        required :payment_method, union: -> { ::CheckoutIntents::PaymentMethod }, api_name: :paymentMethod

        # @!attribute state
        #
        #   @return [Symbol, ::CheckoutIntents::Models::CheckoutIntent::PlacingOrderCheckoutIntent::State]
        required :state, enum: -> { ::CheckoutIntents::CheckoutIntent::PlacingOrderCheckoutIntent::State }

        # @!method initialize(offer:, payment_method:, state:)
        #   @param offer [::CheckoutIntents::Models::Offer]
        #   @param payment_method [::CheckoutIntents::Models::PaymentMethod::StripeTokenPaymentMethod, ::CheckoutIntents::Models::PaymentMethod::BasisTheoryPaymentMethod, ::CheckoutIntents::Models::PaymentMethod::NekudaPaymentMethod, ::CheckoutIntents::Models::PaymentMethod::PravaPaymentMethod, ::CheckoutIntents::Models::PaymentMethod::DrawdownPaymentMethod]
        #   @param state [Symbol, ::CheckoutIntents::Models::CheckoutIntent::PlacingOrderCheckoutIntent::State]

        module State
          extend ::CheckoutIntents::Internal::Type::Enum

          PLACING_ORDER = :placing_order

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class CompletedCheckoutIntent < ::CheckoutIntents::Models::BaseCheckoutIntent
        # @!attribute offer
        #
        #   @return [::CheckoutIntents::Models::Offer]
        required :offer, -> { ::CheckoutIntents::Offer }

        # @!attribute order_id
        #
        #   @return [String, nil]
        required :order_id, String, api_name: :orderId, nil?: true

        # @!attribute payment_method
        #
        #   @return [::CheckoutIntents::Models::PaymentMethod::StripeTokenPaymentMethod, ::CheckoutIntents::Models::PaymentMethod::BasisTheoryPaymentMethod, ::CheckoutIntents::Models::PaymentMethod::NekudaPaymentMethod, ::CheckoutIntents::Models::PaymentMethod::PravaPaymentMethod, ::CheckoutIntents::Models::PaymentMethod::DrawdownPaymentMethod]
        required :payment_method, union: -> { ::CheckoutIntents::PaymentMethod }, api_name: :paymentMethod

        # @!attribute state
        #
        #   @return [Symbol, ::CheckoutIntents::Models::CheckoutIntent::CompletedCheckoutIntent::State]
        required :state, enum: -> { ::CheckoutIntents::CheckoutIntent::CompletedCheckoutIntent::State }

        # @!method initialize(offer:, order_id:, payment_method:, state:)
        #   @param offer [::CheckoutIntents::Models::Offer]
        #   @param order_id [String, nil]
        #   @param payment_method [::CheckoutIntents::Models::PaymentMethod::StripeTokenPaymentMethod, ::CheckoutIntents::Models::PaymentMethod::BasisTheoryPaymentMethod, ::CheckoutIntents::Models::PaymentMethod::NekudaPaymentMethod, ::CheckoutIntents::Models::PaymentMethod::PravaPaymentMethod, ::CheckoutIntents::Models::PaymentMethod::DrawdownPaymentMethod]
        #   @param state [Symbol, ::CheckoutIntents::Models::CheckoutIntent::CompletedCheckoutIntent::State]

        module State
          extend ::CheckoutIntents::Internal::Type::Enum

          COMPLETED = :completed

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class FailedCheckoutIntent < ::CheckoutIntents::Models::BaseCheckoutIntent
        # @!attribute failure_reason
        #
        #   @return [::CheckoutIntents::Models::CheckoutIntent::FailedCheckoutIntent::FailureReason]
        required :failure_reason,
                 -> { ::CheckoutIntents::CheckoutIntent::FailedCheckoutIntent::FailureReason },
                 api_name: :failureReason

        # @!attribute state
        #
        #   @return [Symbol, ::CheckoutIntents::Models::CheckoutIntent::FailedCheckoutIntent::State]
        required :state, enum: -> { ::CheckoutIntents::CheckoutIntent::FailedCheckoutIntent::State }

        # @!attribute offer
        #
        #   @return [::CheckoutIntents::Models::Offer, nil]
        optional :offer, -> { ::CheckoutIntents::Offer }

        # @!attribute payment_method
        #
        #   @return [::CheckoutIntents::Models::PaymentMethod::StripeTokenPaymentMethod, ::CheckoutIntents::Models::PaymentMethod::BasisTheoryPaymentMethod, ::CheckoutIntents::Models::PaymentMethod::NekudaPaymentMethod, ::CheckoutIntents::Models::PaymentMethod::PravaPaymentMethod, ::CheckoutIntents::Models::PaymentMethod::DrawdownPaymentMethod, nil]
        optional :payment_method, union: -> { ::CheckoutIntents::PaymentMethod }, api_name: :paymentMethod

        # @!method initialize(failure_reason:, state:, offer: nil, payment_method: nil)
        #   @param failure_reason [::CheckoutIntents::Models::CheckoutIntent::FailedCheckoutIntent::FailureReason]
        #   @param state [Symbol, ::CheckoutIntents::Models::CheckoutIntent::FailedCheckoutIntent::State]
        #   @param offer [::CheckoutIntents::Models::Offer]
        #   @param payment_method [::CheckoutIntents::Models::PaymentMethod::StripeTokenPaymentMethod, ::CheckoutIntents::Models::PaymentMethod::BasisTheoryPaymentMethod, ::CheckoutIntents::Models::PaymentMethod::NekudaPaymentMethod, ::CheckoutIntents::Models::PaymentMethod::PravaPaymentMethod, ::CheckoutIntents::Models::PaymentMethod::DrawdownPaymentMethod]

        class FailureReason < ::CheckoutIntents::Internal::Type::BaseModel
          # @!attribute code
          #   Type derived from runtime array - always in sync
          #
          #   @return [Symbol, ::CheckoutIntents::Models::CheckoutIntent::FailedCheckoutIntent::FailureReason::Code]
          required :code, enum: -> { ::CheckoutIntents::CheckoutIntent::FailedCheckoutIntent::FailureReason::Code }

          # @!attribute message
          #
          #   @return [String]
          required :message, String

          # @!method initialize(code:, message:)
          #   @param code [Symbol, ::CheckoutIntents::Models::CheckoutIntent::FailedCheckoutIntent::FailureReason::Code] Type derived from runtime array - always in sync
          #
          #   @param message [String]

          # Type derived from runtime array - always in sync
          #
          # @see ::CheckoutIntents::Models::CheckoutIntent::FailedCheckoutIntent::FailureReason#code
          module Code
            extend ::CheckoutIntents::Internal::Type::Enum

            CHECKOUT_INTENT_EXPIRED = :checkout_intent_expired
            PAYMENT_FAILED = :payment_failed
            INSUFFICIENT_STOCK = :insufficient_stock
            PRODUCT_OUT_OF_STOCK = :product_out_of_stock
            OFFER_RETRIEVAL_FAILED = :offer_retrieval_failed
            ORDER_PLACEMENT_FAILED = :order_placement_failed
            DEVELOPER_NOT_FOUND = :developer_not_found
            MISSING_SHIPPING_METHOD = :missing_shipping_method
            UNSUPPORTED_CURRENCY = :unsupported_currency
            INVALID_INPUT = :invalid_input
            INCORRECT_COST_BREAKDOWN = :incorrect_cost_breakdown
            UNSUPPORTED_STORE_NO_GUEST_CHECKOUT = :unsupported_store_no_guest_checkout
            WORKFLOW_INVOCATION_FAILED = :workflow_invocation_failed
            VARIANT_SELECTIONS_INVALID = :variant_selections_invalid
            VARIANT_SELECTIONS_REQUIRED = :variant_selections_required
            FORM_VALIDATION_ERROR = :form_validation_error
            CAPTCHA_BLOCKED = :captcha_blocked
            BOT_PROTECTION_BLOCKED = :bot_protection_blocked
            CONSTRAINT_TOTAL_PRICE_EXCEEDED = :constraint_total_price_exceeded
            CONSTRAINT_SHIPPING_COST_EXCEEDED = :constraint_shipping_cost_exceeded
            PROMO_CODE_DISCOVERY_NOT_ENABLED = :promo_code_discovery_not_enabled
            UNKNOWN = :unknown

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        module State
          extend ::CheckoutIntents::Internal::Type::Enum

          FAILED = :failed

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @!method self.variants
      #   @return [Array(::CheckoutIntents::Models::CheckoutIntent::RetrievingOfferCheckoutIntent, ::CheckoutIntents::Models::CheckoutIntent::AwaitingConfirmationCheckoutIntent, ::CheckoutIntents::Models::CheckoutIntent::PlacingOrderCheckoutIntent, ::CheckoutIntents::Models::CheckoutIntent::CompletedCheckoutIntent, ::CheckoutIntents::Models::CheckoutIntent::FailedCheckoutIntent)]
    end
  end
end
