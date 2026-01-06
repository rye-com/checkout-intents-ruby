# typed: strong

module CheckoutIntents
  module Models
    class VariantSelection < CheckoutIntents::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            CheckoutIntents::VariantSelection,
            CheckoutIntents::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :label

      sig { returns(CheckoutIntents::VariantSelection::Value::Variants) }
      attr_accessor :value

      sig do
        params(
          label: String,
          value: CheckoutIntents::VariantSelection::Value::Variants
        ).returns(T.attached_class)
      end
      def self.new(label:, value:)
      end

      sig do
        override.returns(
          {
            label: String,
            value: CheckoutIntents::VariantSelection::Value::Variants
          }
        )
      end
      def to_hash
      end

      module Value
        extend CheckoutIntents::Internal::Type::Union

        Variants = T.type_alias { T.any(String, Float) }

        sig do
          override.returns(
            T::Array[CheckoutIntents::VariantSelection::Value::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
