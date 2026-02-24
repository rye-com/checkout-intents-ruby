# frozen_string_literal: true

module CheckoutIntents
  module Models
    class VariantSelection < ::CheckoutIntents::Internal::Type::BaseModel
      # @!attribute label
      #
      #   @return [String]
      required :label, String

      # @!attribute value
      #
      #   @return [String, Float]
      required :value, union: -> { ::CheckoutIntents::VariantSelection::Value }

      # @!method initialize(label:, value:)
      #   @param label [String]
      #   @param value [String, Float]

      # @see ::CheckoutIntents::Models::VariantSelection#value
      module Value
        extend ::CheckoutIntents::Internal::Type::Union

        variant String

        variant Float

        # @!method self.variants
        #   @return [Array(String, Float)]
      end
    end
  end
end
