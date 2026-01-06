# typed: strong

module CheckoutIntents
  module Models
    class Offer < CheckoutIntents::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(CheckoutIntents::Offer, CheckoutIntents::Internal::AnyHash)
        end

      sig { returns(CheckoutIntents::Offer::Cost) }
      attr_reader :cost

      sig { params(cost: CheckoutIntents::Offer::Cost::OrHash).void }
      attr_writer :cost

      sig { returns(CheckoutIntents::Offer::Shipping) }
      attr_reader :shipping

      sig { params(shipping: CheckoutIntents::Offer::Shipping::OrHash).void }
      attr_writer :shipping

      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :applied_promo_codes

      sig { params(applied_promo_codes: T::Array[String]).void }
      attr_writer :applied_promo_codes

      sig do
        params(
          cost: CheckoutIntents::Offer::Cost::OrHash,
          shipping: CheckoutIntents::Offer::Shipping::OrHash,
          applied_promo_codes: T::Array[String]
        ).returns(T.attached_class)
      end
      def self.new(cost:, shipping:, applied_promo_codes: nil)
      end

      sig do
        override.returns(
          {
            cost: CheckoutIntents::Offer::Cost,
            shipping: CheckoutIntents::Offer::Shipping,
            applied_promo_codes: T::Array[String]
          }
        )
      end
      def to_hash
      end

      class Cost < CheckoutIntents::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              CheckoutIntents::Offer::Cost,
              CheckoutIntents::Internal::AnyHash
            )
          end

        sig { returns(CheckoutIntents::Money) }
        attr_reader :subtotal

        sig { params(subtotal: CheckoutIntents::Money::OrHash).void }
        attr_writer :subtotal

        sig { returns(CheckoutIntents::Money) }
        attr_reader :total

        sig { params(total: CheckoutIntents::Money::OrHash).void }
        attr_writer :total

        sig { returns(T.nilable(CheckoutIntents::Money)) }
        attr_reader :discount

        sig { params(discount: CheckoutIntents::Money::OrHash).void }
        attr_writer :discount

        sig { returns(T.nilable(CheckoutIntents::Money)) }
        attr_reader :shipping

        sig { params(shipping: CheckoutIntents::Money::OrHash).void }
        attr_writer :shipping

        sig { returns(T.nilable(CheckoutIntents::Money)) }
        attr_reader :surcharge

        sig { params(surcharge: CheckoutIntents::Money::OrHash).void }
        attr_writer :surcharge

        sig { returns(T.nilable(CheckoutIntents::Money)) }
        attr_reader :tax

        sig { params(tax: CheckoutIntents::Money::OrHash).void }
        attr_writer :tax

        sig do
          params(
            subtotal: CheckoutIntents::Money::OrHash,
            total: CheckoutIntents::Money::OrHash,
            discount: CheckoutIntents::Money::OrHash,
            shipping: CheckoutIntents::Money::OrHash,
            surcharge: CheckoutIntents::Money::OrHash,
            tax: CheckoutIntents::Money::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          subtotal:,
          total:,
          discount: nil,
          shipping: nil,
          surcharge: nil,
          tax: nil
        )
        end

        sig do
          override.returns(
            {
              subtotal: CheckoutIntents::Money,
              total: CheckoutIntents::Money,
              discount: CheckoutIntents::Money,
              shipping: CheckoutIntents::Money,
              surcharge: CheckoutIntents::Money,
              tax: CheckoutIntents::Money
            }
          )
        end
        def to_hash
        end
      end

      class Shipping < CheckoutIntents::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              CheckoutIntents::Offer::Shipping,
              CheckoutIntents::Internal::AnyHash
            )
          end

        sig do
          returns(T::Array[CheckoutIntents::Offer::Shipping::AvailableOption])
        end
        attr_accessor :available_options

        sig { returns(T.nilable(String)) }
        attr_reader :selected_option_id

        sig { params(selected_option_id: String).void }
        attr_writer :selected_option_id

        sig do
          params(
            available_options:
              T::Array[
                CheckoutIntents::Offer::Shipping::AvailableOption::OrHash
              ],
            selected_option_id: String
          ).returns(T.attached_class)
        end
        def self.new(available_options:, selected_option_id: nil)
        end

        sig do
          override.returns(
            {
              available_options:
                T::Array[CheckoutIntents::Offer::Shipping::AvailableOption],
              selected_option_id: String
            }
          )
        end
        def to_hash
        end

        class AvailableOption < CheckoutIntents::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                CheckoutIntents::Offer::Shipping::AvailableOption,
                CheckoutIntents::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          sig { returns(CheckoutIntents::Money) }
          attr_reader :cost

          sig { params(cost: CheckoutIntents::Money::OrHash).void }
          attr_writer :cost

          sig { returns(T.nilable(CheckoutIntents::Money)) }
          attr_reader :discount

          sig { params(discount: CheckoutIntents::Money::OrHash).void }
          attr_writer :discount

          sig do
            params(
              id: String,
              cost: CheckoutIntents::Money::OrHash,
              discount: CheckoutIntents::Money::OrHash
            ).returns(T.attached_class)
          end
          def self.new(id:, cost:, discount: nil)
          end

          sig do
            override.returns(
              {
                id: String,
                cost: CheckoutIntents::Money,
                discount: CheckoutIntents::Money
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
