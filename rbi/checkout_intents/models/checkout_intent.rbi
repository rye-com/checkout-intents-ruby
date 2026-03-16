# typed: strong

module CheckoutIntents
  module Models
    module CheckoutIntent
      extend ::CheckoutIntents::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            ::CheckoutIntents::CheckoutIntent::RetrievingOfferCheckoutIntent,
            ::CheckoutIntents::CheckoutIntent::AwaitingConfirmationCheckoutIntent,
            ::CheckoutIntents::CheckoutIntent::PlacingOrderCheckoutIntent,
            ::CheckoutIntents::CheckoutIntent::CompletedCheckoutIntent,
            ::CheckoutIntents::CheckoutIntent::FailedCheckoutIntent
          )
        end

      class RetrievingOfferCheckoutIntent < ::CheckoutIntents::Models::BaseCheckoutIntent
        OrHash =
          T.type_alias do
            T.any(
              ::CheckoutIntents::CheckoutIntent::RetrievingOfferCheckoutIntent,
              ::CheckoutIntents::Internal::AnyHash
            )
          end

        sig do
          returns(
            ::CheckoutIntents::CheckoutIntent::RetrievingOfferCheckoutIntent::State::TaggedSymbol
          )
        end
        attr_accessor :state

        sig do
          params(
            state:
              ::CheckoutIntents::CheckoutIntent::RetrievingOfferCheckoutIntent::State::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(state:)
        end

        sig do
          override.returns(
            {
              state:
                ::CheckoutIntents::CheckoutIntent::RetrievingOfferCheckoutIntent::State::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        module State
          extend ::CheckoutIntents::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ::CheckoutIntents::CheckoutIntent::RetrievingOfferCheckoutIntent::State
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          RETRIEVING_OFFER =
            T.let(
              :retrieving_offer,
              ::CheckoutIntents::CheckoutIntent::RetrievingOfferCheckoutIntent::State::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ::CheckoutIntents::CheckoutIntent::RetrievingOfferCheckoutIntent::State::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class AwaitingConfirmationCheckoutIntent < ::CheckoutIntents::Models::BaseCheckoutIntent
        OrHash =
          T.type_alias do
            T.any(
              ::CheckoutIntents::CheckoutIntent::AwaitingConfirmationCheckoutIntent,
              ::CheckoutIntents::Internal::AnyHash
            )
          end

        sig { returns(::CheckoutIntents::Offer) }
        attr_reader :offer

        sig { params(offer: ::CheckoutIntents::Offer::OrHash).void }
        attr_writer :offer

        sig do
          returns(
            ::CheckoutIntents::CheckoutIntent::AwaitingConfirmationCheckoutIntent::State::TaggedSymbol
          )
        end
        attr_accessor :state

        sig { returns(T.nilable(::CheckoutIntents::PaymentMethod::Variants)) }
        attr_reader :payment_method

        sig do
          params(
            payment_method:
              T.any(
                ::CheckoutIntents::PaymentMethod::StripeTokenPaymentMethod::OrHash,
                ::CheckoutIntents::PaymentMethod::BasisTheoryPaymentMethod::OrHash,
                ::CheckoutIntents::PaymentMethod::NekudaPaymentMethod::OrHash,
                ::CheckoutIntents::PaymentMethod::PravaPaymentMethod::OrHash,
                ::CheckoutIntents::PaymentMethod::DrawdownPaymentMethod::OrHash
              )
          ).void
        end
        attr_writer :payment_method

        sig do
          params(
            offer: ::CheckoutIntents::Offer::OrHash,
            state:
              ::CheckoutIntents::CheckoutIntent::AwaitingConfirmationCheckoutIntent::State::OrSymbol,
            payment_method:
              T.any(
                ::CheckoutIntents::PaymentMethod::StripeTokenPaymentMethod::OrHash,
                ::CheckoutIntents::PaymentMethod::BasisTheoryPaymentMethod::OrHash,
                ::CheckoutIntents::PaymentMethod::NekudaPaymentMethod::OrHash,
                ::CheckoutIntents::PaymentMethod::PravaPaymentMethod::OrHash,
                ::CheckoutIntents::PaymentMethod::DrawdownPaymentMethod::OrHash
              )
          ).returns(T.attached_class)
        end
        def self.new(offer:, state:, payment_method: nil)
        end

        sig do
          override.returns(
            {
              offer: ::CheckoutIntents::Offer,
              state:
                ::CheckoutIntents::CheckoutIntent::AwaitingConfirmationCheckoutIntent::State::TaggedSymbol,
              payment_method: ::CheckoutIntents::PaymentMethod::Variants
            }
          )
        end
        def to_hash
        end

        module State
          extend ::CheckoutIntents::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ::CheckoutIntents::CheckoutIntent::AwaitingConfirmationCheckoutIntent::State
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          AWAITING_CONFIRMATION =
            T.let(
              :awaiting_confirmation,
              ::CheckoutIntents::CheckoutIntent::AwaitingConfirmationCheckoutIntent::State::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ::CheckoutIntents::CheckoutIntent::AwaitingConfirmationCheckoutIntent::State::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class PlacingOrderCheckoutIntent < ::CheckoutIntents::Models::BaseCheckoutIntent
        OrHash =
          T.type_alias do
            T.any(
              ::CheckoutIntents::CheckoutIntent::PlacingOrderCheckoutIntent,
              ::CheckoutIntents::Internal::AnyHash
            )
          end

        sig { returns(::CheckoutIntents::Offer) }
        attr_reader :offer

        sig { params(offer: ::CheckoutIntents::Offer::OrHash).void }
        attr_writer :offer

        sig { returns(::CheckoutIntents::PaymentMethod::Variants) }
        attr_accessor :payment_method

        sig do
          returns(
            ::CheckoutIntents::CheckoutIntent::PlacingOrderCheckoutIntent::State::TaggedSymbol
          )
        end
        attr_accessor :state

        sig do
          params(
            offer: ::CheckoutIntents::Offer::OrHash,
            payment_method:
              T.any(
                ::CheckoutIntents::PaymentMethod::StripeTokenPaymentMethod::OrHash,
                ::CheckoutIntents::PaymentMethod::BasisTheoryPaymentMethod::OrHash,
                ::CheckoutIntents::PaymentMethod::NekudaPaymentMethod::OrHash,
                ::CheckoutIntents::PaymentMethod::PravaPaymentMethod::OrHash,
                ::CheckoutIntents::PaymentMethod::DrawdownPaymentMethod::OrHash
              ),
            state:
              ::CheckoutIntents::CheckoutIntent::PlacingOrderCheckoutIntent::State::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(offer:, payment_method:, state:)
        end

        sig do
          override.returns(
            {
              offer: ::CheckoutIntents::Offer,
              payment_method: ::CheckoutIntents::PaymentMethod::Variants,
              state:
                ::CheckoutIntents::CheckoutIntent::PlacingOrderCheckoutIntent::State::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        module State
          extend ::CheckoutIntents::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ::CheckoutIntents::CheckoutIntent::PlacingOrderCheckoutIntent::State
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PLACING_ORDER =
            T.let(
              :placing_order,
              ::CheckoutIntents::CheckoutIntent::PlacingOrderCheckoutIntent::State::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ::CheckoutIntents::CheckoutIntent::PlacingOrderCheckoutIntent::State::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class CompletedCheckoutIntent < ::CheckoutIntents::Models::BaseCheckoutIntent
        OrHash =
          T.type_alias do
            T.any(
              ::CheckoutIntents::CheckoutIntent::CompletedCheckoutIntent,
              ::CheckoutIntents::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(Time)) }
        attr_accessor :estimated_delivery_date

        sig { returns(::CheckoutIntents::Offer) }
        attr_reader :offer

        sig { params(offer: ::CheckoutIntents::Offer::OrHash).void }
        attr_writer :offer

        sig { returns(T.nilable(String)) }
        attr_accessor :order_id

        sig { returns(::CheckoutIntents::PaymentMethod::Variants) }
        attr_accessor :payment_method

        sig do
          returns(
            ::CheckoutIntents::CheckoutIntent::CompletedCheckoutIntent::State::TaggedSymbol
          )
        end
        attr_accessor :state

        sig do
          params(
            estimated_delivery_date: T.nilable(Time),
            offer: ::CheckoutIntents::Offer::OrHash,
            order_id: T.nilable(String),
            payment_method:
              T.any(
                ::CheckoutIntents::PaymentMethod::StripeTokenPaymentMethod::OrHash,
                ::CheckoutIntents::PaymentMethod::BasisTheoryPaymentMethod::OrHash,
                ::CheckoutIntents::PaymentMethod::NekudaPaymentMethod::OrHash,
                ::CheckoutIntents::PaymentMethod::PravaPaymentMethod::OrHash,
                ::CheckoutIntents::PaymentMethod::DrawdownPaymentMethod::OrHash
              ),
            state:
              ::CheckoutIntents::CheckoutIntent::CompletedCheckoutIntent::State::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          estimated_delivery_date:,
          offer:,
          order_id:,
          payment_method:,
          state:
        )
        end

        sig do
          override.returns(
            {
              estimated_delivery_date: T.nilable(Time),
              offer: ::CheckoutIntents::Offer,
              order_id: T.nilable(String),
              payment_method: ::CheckoutIntents::PaymentMethod::Variants,
              state:
                ::CheckoutIntents::CheckoutIntent::CompletedCheckoutIntent::State::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        module State
          extend ::CheckoutIntents::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ::CheckoutIntents::CheckoutIntent::CompletedCheckoutIntent::State
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          COMPLETED =
            T.let(
              :completed,
              ::CheckoutIntents::CheckoutIntent::CompletedCheckoutIntent::State::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ::CheckoutIntents::CheckoutIntent::CompletedCheckoutIntent::State::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class FailedCheckoutIntent < ::CheckoutIntents::Models::BaseCheckoutIntent
        OrHash =
          T.type_alias do
            T.any(
              ::CheckoutIntents::CheckoutIntent::FailedCheckoutIntent,
              ::CheckoutIntents::Internal::AnyHash
            )
          end

        sig do
          returns(
            ::CheckoutIntents::CheckoutIntent::FailedCheckoutIntent::FailureReason
          )
        end
        attr_reader :failure_reason

        sig do
          params(
            failure_reason:
              ::CheckoutIntents::CheckoutIntent::FailedCheckoutIntent::FailureReason::OrHash
          ).void
        end
        attr_writer :failure_reason

        sig do
          returns(
            ::CheckoutIntents::CheckoutIntent::FailedCheckoutIntent::State::TaggedSymbol
          )
        end
        attr_accessor :state

        sig { returns(T.nilable(::CheckoutIntents::Offer)) }
        attr_reader :offer

        sig { params(offer: ::CheckoutIntents::Offer::OrHash).void }
        attr_writer :offer

        sig { returns(T.nilable(::CheckoutIntents::PaymentMethod::Variants)) }
        attr_reader :payment_method

        sig do
          params(
            payment_method:
              T.any(
                ::CheckoutIntents::PaymentMethod::StripeTokenPaymentMethod::OrHash,
                ::CheckoutIntents::PaymentMethod::BasisTheoryPaymentMethod::OrHash,
                ::CheckoutIntents::PaymentMethod::NekudaPaymentMethod::OrHash,
                ::CheckoutIntents::PaymentMethod::PravaPaymentMethod::OrHash,
                ::CheckoutIntents::PaymentMethod::DrawdownPaymentMethod::OrHash
              )
          ).void
        end
        attr_writer :payment_method

        sig do
          params(
            failure_reason:
              ::CheckoutIntents::CheckoutIntent::FailedCheckoutIntent::FailureReason::OrHash,
            state:
              ::CheckoutIntents::CheckoutIntent::FailedCheckoutIntent::State::OrSymbol,
            offer: ::CheckoutIntents::Offer::OrHash,
            payment_method:
              T.any(
                ::CheckoutIntents::PaymentMethod::StripeTokenPaymentMethod::OrHash,
                ::CheckoutIntents::PaymentMethod::BasisTheoryPaymentMethod::OrHash,
                ::CheckoutIntents::PaymentMethod::NekudaPaymentMethod::OrHash,
                ::CheckoutIntents::PaymentMethod::PravaPaymentMethod::OrHash,
                ::CheckoutIntents::PaymentMethod::DrawdownPaymentMethod::OrHash
              )
          ).returns(T.attached_class)
        end
        def self.new(failure_reason:, state:, offer: nil, payment_method: nil)
        end

        sig do
          override.returns(
            {
              failure_reason:
                ::CheckoutIntents::CheckoutIntent::FailedCheckoutIntent::FailureReason,
              state:
                ::CheckoutIntents::CheckoutIntent::FailedCheckoutIntent::State::TaggedSymbol,
              offer: ::CheckoutIntents::Offer,
              payment_method: ::CheckoutIntents::PaymentMethod::Variants
            }
          )
        end
        def to_hash
        end

        class FailureReason < ::CheckoutIntents::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ::CheckoutIntents::CheckoutIntent::FailedCheckoutIntent::FailureReason,
                ::CheckoutIntents::Internal::AnyHash
              )
            end

          # Type derived from runtime array - always in sync
          sig do
            returns(
              ::CheckoutIntents::CheckoutIntent::FailedCheckoutIntent::FailureReason::Code::TaggedSymbol
            )
          end
          attr_accessor :code

          sig { returns(String) }
          attr_accessor :message

          sig do
            params(
              code:
                ::CheckoutIntents::CheckoutIntent::FailedCheckoutIntent::FailureReason::Code::OrSymbol,
              message: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Type derived from runtime array - always in sync
            code:,
            message:
          )
          end

          sig do
            override.returns(
              {
                code:
                  ::CheckoutIntents::CheckoutIntent::FailedCheckoutIntent::FailureReason::Code::TaggedSymbol,
                message: String
              }
            )
          end
          def to_hash
          end

          # Type derived from runtime array - always in sync
          module Code
            extend ::CheckoutIntents::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ::CheckoutIntents::CheckoutIntent::FailedCheckoutIntent::FailureReason::Code
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            CHECKOUT_INTENT_EXPIRED =
              T.let(
                :checkout_intent_expired,
                ::CheckoutIntents::CheckoutIntent::FailedCheckoutIntent::FailureReason::Code::TaggedSymbol
              )
            PAYMENT_FAILED =
              T.let(
                :payment_failed,
                ::CheckoutIntents::CheckoutIntent::FailedCheckoutIntent::FailureReason::Code::TaggedSymbol
              )
            INSUFFICIENT_STOCK =
              T.let(
                :insufficient_stock,
                ::CheckoutIntents::CheckoutIntent::FailedCheckoutIntent::FailureReason::Code::TaggedSymbol
              )
            PRODUCT_OUT_OF_STOCK =
              T.let(
                :product_out_of_stock,
                ::CheckoutIntents::CheckoutIntent::FailedCheckoutIntent::FailureReason::Code::TaggedSymbol
              )
            OFFER_RETRIEVAL_FAILED =
              T.let(
                :offer_retrieval_failed,
                ::CheckoutIntents::CheckoutIntent::FailedCheckoutIntent::FailureReason::Code::TaggedSymbol
              )
            ORDER_PLACEMENT_FAILED =
              T.let(
                :order_placement_failed,
                ::CheckoutIntents::CheckoutIntent::FailedCheckoutIntent::FailureReason::Code::TaggedSymbol
              )
            DEVELOPER_NOT_FOUND =
              T.let(
                :developer_not_found,
                ::CheckoutIntents::CheckoutIntent::FailedCheckoutIntent::FailureReason::Code::TaggedSymbol
              )
            MISSING_SHIPPING_METHOD =
              T.let(
                :missing_shipping_method,
                ::CheckoutIntents::CheckoutIntent::FailedCheckoutIntent::FailureReason::Code::TaggedSymbol
              )
            UNSUPPORTED_CURRENCY =
              T.let(
                :unsupported_currency,
                ::CheckoutIntents::CheckoutIntent::FailedCheckoutIntent::FailureReason::Code::TaggedSymbol
              )
            INVALID_INPUT =
              T.let(
                :invalid_input,
                ::CheckoutIntents::CheckoutIntent::FailedCheckoutIntent::FailureReason::Code::TaggedSymbol
              )
            INCORRECT_COST_BREAKDOWN =
              T.let(
                :incorrect_cost_breakdown,
                ::CheckoutIntents::CheckoutIntent::FailedCheckoutIntent::FailureReason::Code::TaggedSymbol
              )
            UNSUPPORTED_STORE_NO_GUEST_CHECKOUT =
              T.let(
                :unsupported_store_no_guest_checkout,
                ::CheckoutIntents::CheckoutIntent::FailedCheckoutIntent::FailureReason::Code::TaggedSymbol
              )
            WORKFLOW_INVOCATION_FAILED =
              T.let(
                :workflow_invocation_failed,
                ::CheckoutIntents::CheckoutIntent::FailedCheckoutIntent::FailureReason::Code::TaggedSymbol
              )
            VARIANT_SELECTIONS_INVALID =
              T.let(
                :variant_selections_invalid,
                ::CheckoutIntents::CheckoutIntent::FailedCheckoutIntent::FailureReason::Code::TaggedSymbol
              )
            VARIANT_SELECTIONS_REQUIRED =
              T.let(
                :variant_selections_required,
                ::CheckoutIntents::CheckoutIntent::FailedCheckoutIntent::FailureReason::Code::TaggedSymbol
              )
            FORM_VALIDATION_ERROR =
              T.let(
                :form_validation_error,
                ::CheckoutIntents::CheckoutIntent::FailedCheckoutIntent::FailureReason::Code::TaggedSymbol
              )
            CAPTCHA_BLOCKED =
              T.let(
                :captcha_blocked,
                ::CheckoutIntents::CheckoutIntent::FailedCheckoutIntent::FailureReason::Code::TaggedSymbol
              )
            BOT_PROTECTION_BLOCKED =
              T.let(
                :bot_protection_blocked,
                ::CheckoutIntents::CheckoutIntent::FailedCheckoutIntent::FailureReason::Code::TaggedSymbol
              )
            CONSTRAINT_TOTAL_PRICE_EXCEEDED =
              T.let(
                :constraint_total_price_exceeded,
                ::CheckoutIntents::CheckoutIntent::FailedCheckoutIntent::FailureReason::Code::TaggedSymbol
              )
            CONSTRAINT_SHIPPING_COST_EXCEEDED =
              T.let(
                :constraint_shipping_cost_exceeded,
                ::CheckoutIntents::CheckoutIntent::FailedCheckoutIntent::FailureReason::Code::TaggedSymbol
              )
            PROMO_CODE_DISCOVERY_NOT_ENABLED =
              T.let(
                :promo_code_discovery_not_enabled,
                ::CheckoutIntents::CheckoutIntent::FailedCheckoutIntent::FailureReason::Code::TaggedSymbol
              )
            UNKNOWN =
              T.let(
                :unknown,
                ::CheckoutIntents::CheckoutIntent::FailedCheckoutIntent::FailureReason::Code::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ::CheckoutIntents::CheckoutIntent::FailedCheckoutIntent::FailureReason::Code::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        module State
          extend ::CheckoutIntents::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ::CheckoutIntents::CheckoutIntent::FailedCheckoutIntent::State
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          FAILED =
            T.let(
              :failed,
              ::CheckoutIntents::CheckoutIntent::FailedCheckoutIntent::State::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ::CheckoutIntents::CheckoutIntent::FailedCheckoutIntent::State::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      sig do
        override.returns(T::Array[::CheckoutIntents::CheckoutIntent::Variants])
      end
      def self.variants
      end
    end
  end
end
