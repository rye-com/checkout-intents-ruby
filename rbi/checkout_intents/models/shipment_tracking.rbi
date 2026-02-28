# typed: strong

module CheckoutIntents
  module Models
    class ShipmentTracking < CheckoutIntents::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            CheckoutIntents::ShipmentTracking,
            CheckoutIntents::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(String)) }
      attr_accessor :number

      sig { returns(T.nilable(String)) }
      attr_accessor :carrier_name

      sig do
        returns(T.nilable(CheckoutIntents::ShipmentTracking::DeliveryDate))
      end
      attr_reader :delivery_date

      sig do
        params(
          delivery_date:
            T.nilable(CheckoutIntents::ShipmentTracking::DeliveryDate::OrHash)
        ).void
      end
      attr_writer :delivery_date

      sig { returns(T.nilable(String)) }
      attr_accessor :url

      sig do
        params(
          number: T.nilable(String),
          carrier_name: T.nilable(String),
          delivery_date:
            T.nilable(CheckoutIntents::ShipmentTracking::DeliveryDate::OrHash),
          url: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(number:, carrier_name: nil, delivery_date: nil, url: nil)
      end

      sig do
        override.returns(
          {
            number: T.nilable(String),
            carrier_name: T.nilable(String),
            delivery_date:
              T.nilable(CheckoutIntents::ShipmentTracking::DeliveryDate),
            url: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      class DeliveryDate < CheckoutIntents::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              CheckoutIntents::ShipmentTracking::DeliveryDate,
              CheckoutIntents::Internal::AnyHash
            )
          end

        sig { returns(Time) }
        attr_accessor :estimated

        sig { params(estimated: Time).returns(T.attached_class) }
        def self.new(estimated:)
        end

        sig { override.returns({ estimated: Time }) }
        def to_hash
        end
      end
    end
  end
end
