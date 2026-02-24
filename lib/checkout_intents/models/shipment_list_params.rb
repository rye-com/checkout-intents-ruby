# frozen_string_literal: true

module CheckoutIntents
  module Models
    # @see ::CheckoutIntents::Resources::Shipments#list
    class ShipmentListParams < ::CheckoutIntents::Internal::Type::BaseModel
      extend ::CheckoutIntents::Internal::Type::RequestParameters::Converter
      include ::CheckoutIntents::Internal::Type::RequestParameters

      # @!attribute after
      #
      #   @return [String, nil]
      optional :after, String

      # @!attribute before
      #
      #   @return [String, nil]
      optional :before, String

      # @!attribute ids
      #
      #   @return [Array<String>, nil]
      optional :ids, ::CheckoutIntents::Internal::Type::ArrayOf[String]

      # @!attribute limit
      #
      #   @return [Float, nil]
      optional :limit, Float

      # @!attribute status
      #
      #   @return [Array<Symbol, ::CheckoutIntents::Models::ShipmentListParams::Status>, nil]
      optional :status,
               -> { ::CheckoutIntents::Internal::Type::ArrayOf[enum: ::CheckoutIntents::ShipmentListParams::Status] }

      # @!method initialize(after: nil, before: nil, ids: nil, limit: nil, status: nil, request_options: {})
      #   @param after [String]
      #   @param before [String]
      #   @param ids [Array<String>]
      #   @param limit [Float]
      #   @param status [Array<Symbol, ::CheckoutIntents::Models::ShipmentListParams::Status>]
      #   @param request_options [::CheckoutIntents::RequestOptions, Hash{Symbol=>Object}]

      module Status
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
end
