# typed: strong

module CheckoutIntents
  module Models
    class ProductLookupParams < CheckoutIntents::Internal::Type::BaseModel
      extend CheckoutIntents::Internal::Type::RequestParameters::Converter
      include CheckoutIntents::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            CheckoutIntents::ProductLookupParams,
            CheckoutIntents::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :url

      sig do
        params(
          url: String,
          request_options: CheckoutIntents::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(url:, request_options: {})
      end

      sig do
        override.returns(
          { url: String, request_options: CheckoutIntents::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
