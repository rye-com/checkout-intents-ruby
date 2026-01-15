# typed: strong

module CheckoutIntents
  module Models
    module Betas
      class CheckoutSessionCreateParams < CheckoutIntents::Internal::Type::BaseModel
        extend CheckoutIntents::Internal::Type::RequestParameters::Converter
        include CheckoutIntents::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              CheckoutIntents::Betas::CheckoutSessionCreateParams,
              CheckoutIntents::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :product_url

        sig { returns(Integer) }
        attr_accessor :quantity

        # Optional buyer information, used to pre-fill the checkout form with the buyer's
        # information.
        sig do
          returns(
            T.nilable(
              CheckoutIntents::Betas::CheckoutSessionCreateParams::Buyer
            )
          )
        end
        attr_reader :buyer

        sig do
          params(
            buyer:
              CheckoutIntents::Betas::CheckoutSessionCreateParams::Buyer::OrHash
          ).void
        end
        attr_writer :buyer

        sig do
          returns(
            T.nilable(
              CheckoutIntents::Betas::CheckoutSessionCreateParams::Constraints
            )
          )
        end
        attr_reader :constraints

        sig do
          params(
            constraints:
              CheckoutIntents::Betas::CheckoutSessionCreateParams::Constraints::OrHash
          ).void
        end
        attr_writer :constraints

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :promo_codes

        sig { params(promo_codes: T::Array[String]).void }
        attr_writer :promo_codes

        sig { returns(T.nilable(T::Array[CheckoutIntents::VariantSelection])) }
        attr_reader :variant_selections

        sig do
          params(
            variant_selections:
              T::Array[CheckoutIntents::VariantSelection::OrHash]
          ).void
        end
        attr_writer :variant_selections

        sig do
          params(
            product_url: String,
            quantity: Integer,
            buyer:
              CheckoutIntents::Betas::CheckoutSessionCreateParams::Buyer::OrHash,
            constraints:
              CheckoutIntents::Betas::CheckoutSessionCreateParams::Constraints::OrHash,
            promo_codes: T::Array[String],
            variant_selections:
              T::Array[CheckoutIntents::VariantSelection::OrHash],
            request_options: CheckoutIntents::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          product_url:,
          quantity:,
          # Optional buyer information, used to pre-fill the checkout form with the buyer's
          # information.
          buyer: nil,
          constraints: nil,
          promo_codes: nil,
          variant_selections: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              product_url: String,
              quantity: Integer,
              buyer: CheckoutIntents::Betas::CheckoutSessionCreateParams::Buyer,
              constraints:
                CheckoutIntents::Betas::CheckoutSessionCreateParams::Constraints,
              promo_codes: T::Array[String],
              variant_selections: T::Array[CheckoutIntents::VariantSelection],
              request_options: CheckoutIntents::RequestOptions
            }
          )
        end
        def to_hash
        end

        class Buyer < CheckoutIntents::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                CheckoutIntents::Betas::CheckoutSessionCreateParams::Buyer,
                CheckoutIntents::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_reader :address1

          sig { params(address1: String).void }
          attr_writer :address1

          sig { returns(T.nilable(String)) }
          attr_reader :address2

          sig { params(address2: String).void }
          attr_writer :address2

          sig { returns(T.nilable(String)) }
          attr_reader :city

          sig { params(city: String).void }
          attr_writer :city

          sig { returns(T.nilable(String)) }
          attr_reader :country

          sig { params(country: String).void }
          attr_writer :country

          sig { returns(T.nilable(String)) }
          attr_reader :email

          sig { params(email: String).void }
          attr_writer :email

          sig { returns(T.nilable(String)) }
          attr_reader :first_name

          sig { params(first_name: String).void }
          attr_writer :first_name

          sig { returns(T.nilable(String)) }
          attr_reader :last_name

          sig { params(last_name: String).void }
          attr_writer :last_name

          sig { returns(T.nilable(String)) }
          attr_reader :phone

          sig { params(phone: String).void }
          attr_writer :phone

          sig { returns(T.nilable(String)) }
          attr_reader :postal_code

          sig { params(postal_code: String).void }
          attr_writer :postal_code

          sig { returns(T.nilable(String)) }
          attr_reader :province

          sig { params(province: String).void }
          attr_writer :province

          # Optional buyer information, used to pre-fill the checkout form with the buyer's
          # information.
          sig do
            params(
              address1: String,
              address2: String,
              city: String,
              country: String,
              email: String,
              first_name: String,
              last_name: String,
              phone: String,
              postal_code: String,
              province: String
            ).returns(T.attached_class)
          end
          def self.new(
            address1: nil,
            address2: nil,
            city: nil,
            country: nil,
            email: nil,
            first_name: nil,
            last_name: nil,
            phone: nil,
            postal_code: nil,
            province: nil
          )
          end

          sig do
            override.returns(
              {
                address1: String,
                address2: String,
                city: String,
                country: String,
                email: String,
                first_name: String,
                last_name: String,
                phone: String,
                postal_code: String,
                province: String
              }
            )
          end
          def to_hash
          end
        end

        class Constraints < CheckoutIntents::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                CheckoutIntents::Betas::CheckoutSessionCreateParams::Constraints,
                CheckoutIntents::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(Integer)) }
          attr_reader :max_shipping_price

          sig { params(max_shipping_price: Integer).void }
          attr_writer :max_shipping_price

          sig { returns(T.nilable(Integer)) }
          attr_reader :max_total_price

          sig { params(max_total_price: Integer).void }
          attr_writer :max_total_price

          sig do
            params(
              max_shipping_price: Integer,
              max_total_price: Integer
            ).returns(T.attached_class)
          end
          def self.new(max_shipping_price: nil, max_total_price: nil)
          end

          sig do
            override.returns(
              { max_shipping_price: Integer, max_total_price: Integer }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
