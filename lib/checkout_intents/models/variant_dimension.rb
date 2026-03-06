# frozen_string_literal: true

module CheckoutIntents
  module Models
    class VariantDimension < CheckoutIntents::Internal::Type::BaseModel
      # @!attribute label
      #
      #   @return [String]
      required :label, String

      # @!attribute values
      #
      #   @return [Array<String>]
      required :values, CheckoutIntents::Internal::Type::ArrayOf[String]

      # @!method initialize(label:, values:)
      #   @param label [String]
      #   @param values [Array<String>]
    end
  end
end
