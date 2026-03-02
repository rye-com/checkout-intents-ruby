# typed: strong

module CheckoutIntents
  module Models
    module ShipmentStatus
      extend CheckoutIntents::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, CheckoutIntents::ShipmentStatus) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      OUT_FOR_DELIVERY =
        T.let(:out_for_delivery, CheckoutIntents::ShipmentStatus::TaggedSymbol)
      DELIVERED =
        T.let(:delivered, CheckoutIntents::ShipmentStatus::TaggedSymbol)
      SHIPPED = T.let(:shipped, CheckoutIntents::ShipmentStatus::TaggedSymbol)
      CANCELED = T.let(:canceled, CheckoutIntents::ShipmentStatus::TaggedSymbol)
      DELAYED = T.let(:delayed, CheckoutIntents::ShipmentStatus::TaggedSymbol)
      ORDERED = T.let(:ordered, CheckoutIntents::ShipmentStatus::TaggedSymbol)

      sig do
        override.returns(
          T::Array[CheckoutIntents::ShipmentStatus::TaggedSymbol]
        )
      end
      def self.values
      end
    end
  end
end
