# typed: strong

module CheckoutIntents
  module Models
    module CheckoutIntents
      class ShipmentListParams < ::CheckoutIntents::Internal::Type::BaseModel
        extend ::CheckoutIntents::Internal::Type::RequestParameters::Converter
        include ::CheckoutIntents::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              ::CheckoutIntents::CheckoutIntents::ShipmentListParams,
              ::CheckoutIntents::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(T.nilable(String)) }
        attr_reader :after

        sig { params(after: String).void }
        attr_writer :after

        sig { returns(T.nilable(String)) }
        attr_reader :before

        sig { params(before: String).void }
        attr_writer :before

        sig { returns(T.nilable(Float)) }
        attr_reader :limit

        sig { params(limit: Float).void }
        attr_writer :limit

        sig do
          params(
            id: String,
            after: String,
            before: String,
            limit: Float,
            request_options: CheckoutIntents::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          after: nil,
          before: nil,
          limit: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              id: String,
              after: String,
              before: String,
              limit: Float,
              request_options: ::CheckoutIntents::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
