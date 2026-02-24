# typed: strong

module CheckoutIntents
  module Models
    class Buyer < ::CheckoutIntents::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(::CheckoutIntents::Buyer, ::CheckoutIntents::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :address1

      sig { returns(String) }
      attr_accessor :city

      sig { returns(String) }
      attr_accessor :country

      sig { returns(String) }
      attr_accessor :email

      sig { returns(String) }
      attr_accessor :first_name

      sig { returns(String) }
      attr_accessor :last_name

      sig { returns(String) }
      attr_accessor :phone

      sig { returns(String) }
      attr_accessor :postal_code

      sig { returns(String) }
      attr_accessor :province

      sig { returns(T.nilable(String)) }
      attr_reader :address2

      sig { params(address2: String).void }
      attr_writer :address2

      sig do
        params(
          address1: String,
          city: String,
          country: String,
          email: String,
          first_name: String,
          last_name: String,
          phone: String,
          postal_code: String,
          province: String,
          address2: String
        ).returns(T.attached_class)
      end
      def self.new(
        address1:,
        city:,
        country:,
        email:,
        first_name:,
        last_name:,
        phone:,
        postal_code:,
        province:,
        address2: nil
      )
      end

      sig do
        override.returns(
          {
            address1: String,
            city: String,
            country: String,
            email: String,
            first_name: String,
            last_name: String,
            phone: String,
            postal_code: String,
            province: String,
            address2: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
