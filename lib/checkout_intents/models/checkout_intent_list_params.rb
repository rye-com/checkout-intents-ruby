# frozen_string_literal: true

module CheckoutIntents
  module Models
    # @see ::CheckoutIntents::Resources::CheckoutIntents#list
    class CheckoutIntentListParams < ::CheckoutIntents::Internal::Type::BaseModel
      extend ::CheckoutIntents::Internal::Type::RequestParameters::Converter
      include ::CheckoutIntents::Internal::Type::RequestParameters

      # @!attribute id
      #
      #   @return [Array<String>, nil]
      optional :id, ::CheckoutIntents::Internal::Type::ArrayOf[String]

      # @!attribute after
      #
      #   @return [String, nil]
      optional :after, String

      # @!attribute before
      #
      #   @return [String, nil]
      optional :before, String

      # @!attribute limit
      #
      #   @return [Float, nil]
      optional :limit, Float

      # @!attribute state
      #
      #   @return [Array<Symbol, ::CheckoutIntents::Models::CheckoutIntentListParams::State>, nil]
      optional :state,
               -> { ::CheckoutIntents::Internal::Type::ArrayOf[enum: ::CheckoutIntents::CheckoutIntentListParams::State] }

      # @!method initialize(id: nil, after: nil, before: nil, limit: nil, state: nil, request_options: {})
      #   @param id [Array<String>]
      #   @param after [String]
      #   @param before [String]
      #   @param limit [Float]
      #   @param state [Array<Symbol, ::CheckoutIntents::Models::CheckoutIntentListParams::State>]
      #   @param request_options [::CheckoutIntents::RequestOptions, Hash{Symbol=>Object}]

      module State
        extend ::CheckoutIntents::Internal::Type::Enum

        COMPLETED = :completed
        FAILED = :failed
        RETRIEVING_OFFER = :retrieving_offer
        AWAITING_CONFIRMATION = :awaiting_confirmation
        PLACING_ORDER = :placing_order

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
