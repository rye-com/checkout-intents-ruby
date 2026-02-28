# typed: strong

module CheckoutIntents
  module Models
    class ShipmentListParams < ::CheckoutIntents::Internal::Type::BaseModel
      extend ::CheckoutIntents::Internal::Type::RequestParameters::Converter
      include ::CheckoutIntents::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ::CheckoutIntents::ShipmentListParams,
            ::CheckoutIntents::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(String)) }
      attr_reader :after

      sig { params(after: String).void }
      attr_writer :after

      sig { returns(T.nilable(String)) }
      attr_reader :before

      sig { params(before: String).void }
      attr_writer :before

      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :ids

      sig { params(ids: T::Array[String]).void }
      attr_writer :ids

      sig { returns(T.nilable(Float)) }
      attr_reader :limit

      sig { params(limit: Float).void }
      attr_writer :limit

      sig do
        returns(T.nilable(T::Array[::CheckoutIntents::ShipmentStatus::OrSymbol]))
      end
      attr_reader :status

      sig do
        params(status: T::Array[::CheckoutIntents::ShipmentStatus::OrSymbol]).void
      end
      attr_writer :status

      sig do
        params(
          after: String,
          before: String,
          ids: T::Array[String],
          limit: Float,
          status: T::Array[::CheckoutIntents::ShipmentStatus::OrSymbol],
          request_options: ::CheckoutIntents::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        after: nil,
        before: nil,
        ids: nil,
        limit: nil,
        status: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            after: String,
            before: String,
            ids: T::Array[String],
            limit: Float,
            status: T::Array[::CheckoutIntents::ShipmentStatus::OrSymbol],
            request_options: ::CheckoutIntents::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
