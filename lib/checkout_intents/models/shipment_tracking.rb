# frozen_string_literal: true

module CheckoutIntents
  module Models
    class ShipmentTracking < CheckoutIntents::Internal::Type::BaseModel
      # @!attribute number
      #
      #   @return [String, nil]
      required :number, String, nil?: true

      # @!attribute carrier_name
      #
      #   @return [String, nil]
      optional :carrier_name, String, api_name: :carrierName, nil?: true

      # @!attribute delivery_date
      #
      #   @return [CheckoutIntents::Models::ShipmentTracking::DeliveryDate, nil]
      optional :delivery_date,
               -> { CheckoutIntents::ShipmentTracking::DeliveryDate },
               api_name: :deliveryDate,
               nil?: true

      # @!attribute url
      #
      #   @return [String, nil]
      optional :url, String, nil?: true

      # @!method initialize(number:, carrier_name: nil, delivery_date: nil, url: nil)
      #   @param number [String, nil]
      #   @param carrier_name [String, nil]
      #   @param delivery_date [CheckoutIntents::Models::ShipmentTracking::DeliveryDate, nil]
      #   @param url [String, nil]

      # @see CheckoutIntents::Models::ShipmentTracking#delivery_date
      class DeliveryDate < CheckoutIntents::Internal::Type::BaseModel
        # @!attribute estimated
        #
        #   @return [Time]
        required :estimated, Time

        # @!method initialize(estimated:)
        #   @param estimated [Time]
      end
    end
  end
end
