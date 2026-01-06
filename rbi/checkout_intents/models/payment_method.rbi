# typed: strong

module CheckoutIntents
  module Models
    module PaymentMethod
      extend CheckoutIntents::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            CheckoutIntents::PaymentMethod::StripeTokenPaymentMethod,
            CheckoutIntents::PaymentMethod::BasisTheoryPaymentMethod,
            CheckoutIntents::PaymentMethod::NekudaPaymentMethod
          )
        end

      class StripeTokenPaymentMethod < CheckoutIntents::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              CheckoutIntents::PaymentMethod::StripeTokenPaymentMethod,
              CheckoutIntents::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :stripe_token

        sig do
          returns(
            CheckoutIntents::PaymentMethod::StripeTokenPaymentMethod::Type::OrSymbol
          )
        end
        attr_accessor :type

        sig do
          params(
            stripe_token: String,
            type:
              CheckoutIntents::PaymentMethod::StripeTokenPaymentMethod::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(stripe_token:, type:)
        end

        sig do
          override.returns(
            {
              stripe_token: String,
              type:
                CheckoutIntents::PaymentMethod::StripeTokenPaymentMethod::Type::OrSymbol
            }
          )
        end
        def to_hash
        end

        module Type
          extend CheckoutIntents::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                CheckoutIntents::PaymentMethod::StripeTokenPaymentMethod::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          STRIPE_TOKEN =
            T.let(
              :stripe_token,
              CheckoutIntents::PaymentMethod::StripeTokenPaymentMethod::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                CheckoutIntents::PaymentMethod::StripeTokenPaymentMethod::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class BasisTheoryPaymentMethod < CheckoutIntents::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              CheckoutIntents::PaymentMethod::BasisTheoryPaymentMethod,
              CheckoutIntents::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :basis_theory_token

        sig do
          returns(
            CheckoutIntents::PaymentMethod::BasisTheoryPaymentMethod::Type::OrSymbol
          )
        end
        attr_accessor :type

        sig do
          params(
            basis_theory_token: String,
            type:
              CheckoutIntents::PaymentMethod::BasisTheoryPaymentMethod::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(basis_theory_token:, type:)
        end

        sig do
          override.returns(
            {
              basis_theory_token: String,
              type:
                CheckoutIntents::PaymentMethod::BasisTheoryPaymentMethod::Type::OrSymbol
            }
          )
        end
        def to_hash
        end

        module Type
          extend CheckoutIntents::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                CheckoutIntents::PaymentMethod::BasisTheoryPaymentMethod::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          BASIS_THEORY_TOKEN =
            T.let(
              :basis_theory_token,
              CheckoutIntents::PaymentMethod::BasisTheoryPaymentMethod::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                CheckoutIntents::PaymentMethod::BasisTheoryPaymentMethod::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class NekudaPaymentMethod < CheckoutIntents::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              CheckoutIntents::PaymentMethod::NekudaPaymentMethod,
              CheckoutIntents::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :nekuda_user_id

        sig do
          returns(
            CheckoutIntents::PaymentMethod::NekudaPaymentMethod::Type::OrSymbol
          )
        end
        attr_accessor :type

        # Construct a type with a set of properties K of type T
        sig do
          returns(
            T.nilable(
              T::Hash[
                Symbol,
                CheckoutIntents::PaymentMethod::NekudaPaymentMethod::NekudaMandateData::Variants
              ]
            )
          )
        end
        attr_reader :nekuda_mandate_data

        sig do
          params(
            nekuda_mandate_data:
              T::Hash[
                Symbol,
                CheckoutIntents::PaymentMethod::NekudaPaymentMethod::NekudaMandateData::Variants
              ]
          ).void
        end
        attr_writer :nekuda_mandate_data

        sig do
          params(
            nekuda_user_id: String,
            type:
              CheckoutIntents::PaymentMethod::NekudaPaymentMethod::Type::OrSymbol,
            nekuda_mandate_data:
              T::Hash[
                Symbol,
                CheckoutIntents::PaymentMethod::NekudaPaymentMethod::NekudaMandateData::Variants
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          nekuda_user_id:,
          type:,
          # Construct a type with a set of properties K of type T
          nekuda_mandate_data: nil
        )
        end

        sig do
          override.returns(
            {
              nekuda_user_id: String,
              type:
                CheckoutIntents::PaymentMethod::NekudaPaymentMethod::Type::OrSymbol,
              nekuda_mandate_data:
                T::Hash[
                  Symbol,
                  CheckoutIntents::PaymentMethod::NekudaPaymentMethod::NekudaMandateData::Variants
                ]
            }
          )
        end
        def to_hash
        end

        module Type
          extend CheckoutIntents::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                CheckoutIntents::PaymentMethod::NekudaPaymentMethod::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          NEKUDA_TOKEN =
            T.let(
              :nekuda_token,
              CheckoutIntents::PaymentMethod::NekudaPaymentMethod::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                CheckoutIntents::PaymentMethod::NekudaPaymentMethod::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        module NekudaMandateData
          extend CheckoutIntents::Internal::Type::Union

          Variants = T.type_alias { T.any(String, Float) }

          sig do
            override.returns(
              T::Array[
                CheckoutIntents::PaymentMethod::NekudaPaymentMethod::NekudaMandateData::Variants
              ]
            )
          end
          def self.variants
          end
        end
      end

      sig do
        override.returns(T::Array[CheckoutIntents::PaymentMethod::Variants])
      end
      def self.variants
      end
    end
  end
end
