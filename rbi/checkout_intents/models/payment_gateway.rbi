# typed: strong

module CheckoutIntents
  module Models
    module PaymentGateway
      extend ::CheckoutIntents::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, ::CheckoutIntents::PaymentGateway) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      BASIS_THEORY =
        T.let(:"basis-theory", ::CheckoutIntents::PaymentGateway::TaggedSymbol)

      sig do
        override.returns(
          T::Array[::CheckoutIntents::PaymentGateway::TaggedSymbol]
        )
      end
      def self.values
      end
    end
  end
end
