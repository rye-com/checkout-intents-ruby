# typed: strong

module CheckoutIntents
  module Models
    class BillingGetBalanceResponse < ::CheckoutIntents::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ::CheckoutIntents::Models::BillingGetBalanceResponse,
            ::CheckoutIntents::Internal::AnyHash
          )
        end

      sig { returns(::CheckoutIntents::Money) }
      attr_reader :balance

      sig { params(balance: ::CheckoutIntents::Money::OrHash).void }
      attr_writer :balance

      sig { returns(T::Boolean) }
      attr_accessor :drawdown_enabled

      sig do
        params(
          balance: ::CheckoutIntents::Money::OrHash,
          drawdown_enabled: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(balance:, drawdown_enabled:)
      end

      sig do
        override.returns(
          { balance: ::CheckoutIntents::Money, drawdown_enabled: T::Boolean }
        )
      end
      def to_hash
      end
    end
  end
end
