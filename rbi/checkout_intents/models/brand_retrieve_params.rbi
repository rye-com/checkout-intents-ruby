# typed: strong

module CheckoutIntents
  module Models
    class BrandRetrieveParams < CheckoutIntents::Internal::Type::BaseModel
      extend CheckoutIntents::Internal::Type::RequestParameters::Converter
      include CheckoutIntents::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            CheckoutIntents::BrandRetrieveParams,
            CheckoutIntents::Internal::AnyHash
          )
        end

      # Represents a valid domain name string.
      sig { returns(String) }
      attr_accessor :domain

      sig do
        params(
          domain: String,
          request_options: CheckoutIntents::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Represents a valid domain name string.
        domain:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { domain: String, request_options: CheckoutIntents::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
