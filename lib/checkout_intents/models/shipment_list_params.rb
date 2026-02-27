# frozen_string_literal: true

module CheckoutIntents
  module Models
    # @see CheckoutIntents::Resources::Shipments#list
    class ShipmentListParams < CheckoutIntents::Internal::Type::BaseModel
      extend CheckoutIntents::Internal::Type::RequestParameters::Converter
      include CheckoutIntents::Internal::Type::RequestParameters

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
      optional :ids, CheckoutIntents::Internal::Type::ArrayOf[String]

      # @!attribute limit
      #
      #   @return [Float, nil]
      optional :limit, Float

      # @!attribute status
      #
      #   @return [Array<Symbol, CheckoutIntents::Models::ShipmentStatus>, nil]
      optional :status, -> { CheckoutIntents::Internal::Type::ArrayOf[enum: CheckoutIntents::ShipmentStatus] }

      # @!method initialize(after: nil, before: nil, ids: nil, limit: nil, status: nil, request_options: {})
      #   @param after [String]
      #   @param before [String]
      #   @param ids [Array<String>]
      #   @param limit [Float]
      #   @param status [Array<Symbol, CheckoutIntents::Models::ShipmentStatus>]
      #   @param request_options [CheckoutIntents::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
