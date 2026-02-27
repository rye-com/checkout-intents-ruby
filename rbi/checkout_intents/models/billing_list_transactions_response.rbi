# typed: strong

module CheckoutIntents
  module Models
    class BillingListTransactionsResponse < CheckoutIntents::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            CheckoutIntents::Models::BillingListTransactionsResponse,
            CheckoutIntents::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(CheckoutIntents::Money) }
      attr_reader :amount

      sig { params(amount: CheckoutIntents::Money::OrHash).void }
      attr_writer :amount

      sig { returns(Time) }
      attr_accessor :created_at

      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      # Construct a type with a set of properties K of type T
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :metadata

      sig { params(metadata: T::Hash[Symbol, String]).void }
      attr_writer :metadata

      sig do
        params(
          id: String,
          amount: CheckoutIntents::Money::OrHash,
          created_at: Time,
          description: String,
          metadata: T::Hash[Symbol, String]
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        amount:,
        created_at:,
        description: nil,
        # Construct a type with a set of properties K of type T
        metadata: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            amount: CheckoutIntents::Money,
            created_at: Time,
            description: String,
            metadata: T::Hash[Symbol, String]
          }
        )
      end
      def to_hash
      end
    end
  end
end
