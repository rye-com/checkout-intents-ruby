# frozen_string_literal: true

module CheckoutIntents
  module Models
    module PaymentMethod
      extend CheckoutIntents::Internal::Type::Union

      variant -> { CheckoutIntents::PaymentMethod::StripeTokenPaymentMethod }

      variant -> { CheckoutIntents::PaymentMethod::BasisTheoryPaymentMethod }

      variant -> { CheckoutIntents::PaymentMethod::NekudaPaymentMethod }

      variant -> { CheckoutIntents::PaymentMethod::PravaPaymentMethod }

      variant -> { CheckoutIntents::PaymentMethod::DrawdownPaymentMethod }

      class StripeTokenPaymentMethod < CheckoutIntents::Internal::Type::BaseModel
        # @!attribute stripe_token
        #
        #   @return [String]
        required :stripe_token, String, api_name: :stripeToken

        # @!attribute type
        #
        #   @return [Symbol, CheckoutIntents::Models::PaymentMethod::StripeTokenPaymentMethod::Type]
        required :type, enum: -> { CheckoutIntents::PaymentMethod::StripeTokenPaymentMethod::Type }

        # @!method initialize(stripe_token:, type:)
        #   @param stripe_token [String]
        #   @param type [Symbol, CheckoutIntents::Models::PaymentMethod::StripeTokenPaymentMethod::Type]

        # @see CheckoutIntents::Models::PaymentMethod::StripeTokenPaymentMethod#type
        module Type
          extend CheckoutIntents::Internal::Type::Enum

          STRIPE_TOKEN = :stripe_token

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class BasisTheoryPaymentMethod < CheckoutIntents::Internal::Type::BaseModel
        # @!attribute basis_theory_token
        #
        #   @return [String]
        required :basis_theory_token, String, api_name: :basisTheoryToken

        # @!attribute type
        #
        #   @return [Symbol, CheckoutIntents::Models::PaymentMethod::BasisTheoryPaymentMethod::Type]
        required :type, enum: -> { CheckoutIntents::PaymentMethod::BasisTheoryPaymentMethod::Type }

        # @!method initialize(basis_theory_token:, type:)
        #   @param basis_theory_token [String]
        #   @param type [Symbol, CheckoutIntents::Models::PaymentMethod::BasisTheoryPaymentMethod::Type]

        # @see CheckoutIntents::Models::PaymentMethod::BasisTheoryPaymentMethod#type
        module Type
          extend CheckoutIntents::Internal::Type::Enum

          BASIS_THEORY_TOKEN = :basis_theory_token

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class NekudaPaymentMethod < CheckoutIntents::Internal::Type::BaseModel
        # @!attribute nekuda_user_id
        #
        #   @return [String]
        required :nekuda_user_id, String, api_name: :nekudaUserId

        # @!attribute type
        #
        #   @return [Symbol, CheckoutIntents::Models::PaymentMethod::NekudaPaymentMethod::Type]
        required :type, enum: -> { CheckoutIntents::PaymentMethod::NekudaPaymentMethod::Type }

        # @!attribute nekuda_mandate_data
        #   Construct a type with a set of properties K of type T
        #
        #   @return [Hash{Symbol=>String, Float}, nil]
        optional :nekuda_mandate_data,
                 -> {
                   CheckoutIntents::Internal::Type::HashOf[union: CheckoutIntents::PaymentMethod::NekudaPaymentMethod::NekudaMandateData]
                 },
                 api_name: :nekudaMandateData

        # @!method initialize(nekuda_user_id:, type:, nekuda_mandate_data: nil)
        #   @param nekuda_user_id [String]
        #
        #   @param type [Symbol, CheckoutIntents::Models::PaymentMethod::NekudaPaymentMethod::Type]
        #
        #   @param nekuda_mandate_data [Hash{Symbol=>String, Float}] Construct a type with a set of properties K of type T

        # @see CheckoutIntents::Models::PaymentMethod::NekudaPaymentMethod#type
        module Type
          extend CheckoutIntents::Internal::Type::Enum

          NEKUDA_TOKEN = :nekuda_token

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        module NekudaMandateData
          extend CheckoutIntents::Internal::Type::Union

          variant String

          variant Float

          # @!method self.variants
          #   @return [Array(String, Float)]
        end
      end

      class PravaPaymentMethod < CheckoutIntents::Internal::Type::BaseModel
        # @!attribute prava_token
        #
        #   @return [String]
        required :prava_token, String, api_name: :pravaToken

        # @!attribute type
        #
        #   @return [Symbol, CheckoutIntents::Models::PaymentMethod::PravaPaymentMethod::Type]
        required :type, enum: -> { CheckoutIntents::PaymentMethod::PravaPaymentMethod::Type }

        # @!method initialize(prava_token:, type:)
        #   @param prava_token [String]
        #   @param type [Symbol, CheckoutIntents::Models::PaymentMethod::PravaPaymentMethod::Type]

        # @see CheckoutIntents::Models::PaymentMethod::PravaPaymentMethod#type
        module Type
          extend CheckoutIntents::Internal::Type::Enum

          PRAVA_TOKEN = :prava_token

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class DrawdownPaymentMethod < CheckoutIntents::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, CheckoutIntents::Models::PaymentMethod::DrawdownPaymentMethod::Type]
        required :type, enum: -> { CheckoutIntents::PaymentMethod::DrawdownPaymentMethod::Type }

        # @!method initialize(type:)
        #   @param type [Symbol, CheckoutIntents::Models::PaymentMethod::DrawdownPaymentMethod::Type]

        # @see CheckoutIntents::Models::PaymentMethod::DrawdownPaymentMethod#type
        module Type
          extend CheckoutIntents::Internal::Type::Enum

          DRAWDOWN = :drawdown

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @!method self.variants
      #   @return [Array(CheckoutIntents::Models::PaymentMethod::StripeTokenPaymentMethod, CheckoutIntents::Models::PaymentMethod::BasisTheoryPaymentMethod, CheckoutIntents::Models::PaymentMethod::NekudaPaymentMethod, CheckoutIntents::Models::PaymentMethod::PravaPaymentMethod, CheckoutIntents::Models::PaymentMethod::DrawdownPaymentMethod)]
    end
  end
end
