# typed: strong

module CheckoutIntents
  module Models
    class CheckoutIntentListParams < ::CheckoutIntents::Internal::Type::BaseModel
      extend ::CheckoutIntents::Internal::Type::RequestParameters::Converter
      include ::CheckoutIntents::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ::CheckoutIntents::CheckoutIntentListParams,
            ::CheckoutIntents::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :id

      sig { params(id: T::Array[String]).void }
      attr_writer :id

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
        returns(
          T.nilable(
            T::Array[
              ::CheckoutIntents::CheckoutIntentListParams::State::OrSymbol
            ]
          )
        )
      end
      attr_reader :state

      sig do
        params(
          state:
            T::Array[
              ::CheckoutIntents::CheckoutIntentListParams::State::OrSymbol
            ]
        ).void
      end
      attr_writer :state

      sig do
        params(
          id: T::Array[String],
          after: String,
          before: String,
          limit: Float,
          state:
            T::Array[
              ::CheckoutIntents::CheckoutIntentListParams::State::OrSymbol
            ],
          request_options: ::CheckoutIntents::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        id: nil,
        after: nil,
        before: nil,
        limit: nil,
        state: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            id: T::Array[String],
            after: String,
            before: String,
            limit: Float,
            state:
              T::Array[
                ::CheckoutIntents::CheckoutIntentListParams::State::OrSymbol
              ],
            request_options: ::CheckoutIntents::RequestOptions
          }
        )
      end
      def to_hash
      end

      module State
        extend ::CheckoutIntents::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ::CheckoutIntents::CheckoutIntentListParams::State)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        COMPLETED =
          T.let(
            :completed,
            ::CheckoutIntents::CheckoutIntentListParams::State::TaggedSymbol
          )
        FAILED =
          T.let(
            :failed,
            ::CheckoutIntents::CheckoutIntentListParams::State::TaggedSymbol
          )
        RETRIEVING_OFFER =
          T.let(
            :retrieving_offer,
            ::CheckoutIntents::CheckoutIntentListParams::State::TaggedSymbol
          )
        AWAITING_CONFIRMATION =
          T.let(
            :awaiting_confirmation,
            ::CheckoutIntents::CheckoutIntentListParams::State::TaggedSymbol
          )
        PLACING_ORDER =
          T.let(
            :placing_order,
            ::CheckoutIntents::CheckoutIntentListParams::State::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ::CheckoutIntents::CheckoutIntentListParams::State::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
