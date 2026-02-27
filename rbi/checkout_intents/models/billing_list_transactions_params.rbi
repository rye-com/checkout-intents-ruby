# typed: strong

module CheckoutIntents
  module Models
    class BillingListTransactionsParams < ::CheckoutIntents::Internal::Type::BaseModel
      extend ::CheckoutIntents::Internal::Type::RequestParameters::Converter
      include ::CheckoutIntents::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ::CheckoutIntents::BillingListTransactionsParams,
            ::CheckoutIntents::Internal::AnyHash
          )
        end

      # Cursor for forward pagination (transaction ID to start after)
      sig { returns(T.nilable(String)) }
      attr_reader :after

      sig { params(after: String).void }
      attr_writer :after

      # Cursor for backward pagination (transaction ID to end before)
      sig { returns(T.nilable(String)) }
      attr_reader :before

      sig { params(before: String).void }
      attr_writer :before

      # Maximum number of transactions to return (default 20)
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      sig do
        params(
          after: String,
          before: String,
          limit: Integer,
          request_options: ::CheckoutIntents::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Cursor for forward pagination (transaction ID to start after)
        after: nil,
        # Cursor for backward pagination (transaction ID to end before)
        before: nil,
        # Maximum number of transactions to return (default 20)
        limit: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            after: String,
            before: String,
            limit: Integer,
            request_options: ::CheckoutIntents::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
