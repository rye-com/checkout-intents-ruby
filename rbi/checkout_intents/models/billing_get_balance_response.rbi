<<<<<<< HEAD
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

      sig do
        params(balance: ::CheckoutIntents::Money::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(balance:)
      end

      sig { override.returns({ balance: ::CheckoutIntents::Money }) }
      def to_hash
      end
    end
  end
end
||||||| parent of 59fce0d (chore(internal): improvements)
=======
# typed: strong

module CheckoutIntents
  module Models
    class BillingGetBalanceResponse < CheckoutIntents::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            CheckoutIntents::Models::BillingGetBalanceResponse,
            CheckoutIntents::Internal::AnyHash
          )
        end

      sig { returns(CheckoutIntents::Money) }
      attr_reader :balance

      sig { params(balance: CheckoutIntents::Money::OrHash).void }
      attr_writer :balance

      sig do
        params(balance: CheckoutIntents::Money::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(balance:)
      end

      sig { override.returns({ balance: CheckoutIntents::Money }) }
      def to_hash
      end
    end
  end
end
>>>>>>> 59fce0d (chore(internal): improvements)
