# frozen_string_literal: true

module CheckoutIntents
  module Models
    class ShipmentTracking < ::CheckoutIntents::Internal::Type::BaseModel
      # @!attribute number
      #
      #   @return [String, nil]
      required :number, String, nil?: true

      # @!attribute carrier_name
      #
      #   @return [String, nil]
      optional :carrier_name, String, api_name: :carrierName, nil?: true

      # @!attribute estimated_delivery_date
      #
      #   @return [Time, nil]
      optional :estimated_delivery_date, Time, api_name: :estimatedDeliveryDate, nil?: true

      # @!attribute url
      #
      #   @return [String, nil]
      optional :url, String, nil?: true

      # @!method initialize(number:, carrier_name: nil, estimated_delivery_date: nil, url: nil)
      #   @param number [String, nil]
      #   @param carrier_name [String, nil]
      #   @param estimated_delivery_date [Time, nil]
      #   @param url [String, nil]
    end
  end
end
