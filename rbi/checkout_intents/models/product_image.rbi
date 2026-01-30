# typed: strong

module CheckoutIntents
  module Models
    class ProductImage < CheckoutIntents::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            CheckoutIntents::ProductImage,
            CheckoutIntents::Internal::AnyHash
          )
        end

      sig { returns(T::Boolean) }
      attr_accessor :is_featured

      sig { returns(String) }
      attr_accessor :url

      sig do
        params(is_featured: T::Boolean, url: String).returns(T.attached_class)
      end
      def self.new(is_featured:, url:)
      end

      sig { override.returns({ is_featured: T::Boolean, url: String }) }
      def to_hash
      end
    end
  end
end
