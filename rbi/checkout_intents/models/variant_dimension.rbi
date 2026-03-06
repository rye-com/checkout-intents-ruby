# typed: strong

module CheckoutIntents
  module Models
    class VariantDimension < CheckoutIntents::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            CheckoutIntents::VariantDimension,
            CheckoutIntents::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :label

      sig { returns(T::Array[String]) }
      attr_accessor :values

      sig do
        params(label: String, values: T::Array[String]).returns(
          T.attached_class
        )
      end
      def self.new(label:, values:)
      end

      sig { override.returns({ label: String, values: T::Array[String] }) }
      def to_hash
      end
    end
  end
end
