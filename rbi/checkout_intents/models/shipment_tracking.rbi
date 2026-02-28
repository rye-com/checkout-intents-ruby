# typed: strong

module CheckoutIntents
  module Models
    class ShipmentTracking < ::CheckoutIntents::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ::CheckoutIntents::ShipmentTracking,
            ::CheckoutIntents::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(String)) }
      attr_accessor :number

      sig { returns(T.nilable(String)) }
      attr_accessor :carrier_name

      sig { returns(T.nilable(Time)) }
      attr_accessor :estimated_delivery_date

      sig { returns(T.nilable(String)) }
      attr_accessor :url

      sig do
        params(
          number: T.nilable(String),
          carrier_name: T.nilable(String),
          estimated_delivery_date: T.nilable(Time),
          url: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        number:,
        carrier_name: nil,
        estimated_delivery_date: nil,
        url: nil
      )
      end

      sig do
        override.returns(
          {
            number: T.nilable(String),
            carrier_name: T.nilable(String),
            estimated_delivery_date: T.nilable(Time),
            url: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
