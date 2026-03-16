# frozen_string_literal: true

module CheckoutIntents
  module Models
    module ShipmentStatus
      extend ::CheckoutIntents::Internal::Type::Enum

      OUT_FOR_DELIVERY = :out_for_delivery
      DELIVERED = :delivered
      SHIPPED = :shipped
      CANCELED = :canceled
      DELAYED = :delayed
      ORDERED = :ordered

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
