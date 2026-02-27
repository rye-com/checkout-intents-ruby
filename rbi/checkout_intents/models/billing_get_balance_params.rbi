<<<<<<< HEAD
# typed: strong

module CheckoutIntents
  module Models
    class BillingGetBalanceParams < ::CheckoutIntents::Internal::Type::BaseModel
      extend ::CheckoutIntents::Internal::Type::RequestParameters::Converter
      include ::CheckoutIntents::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ::CheckoutIntents::BillingGetBalanceParams,
            ::CheckoutIntents::Internal::AnyHash
          )
        end

      sig do
        params(
          request_options: ::CheckoutIntents::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(request_options: {})
      end

      sig do
        override.returns({ request_options: ::CheckoutIntents::RequestOptions })
      end
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
    class BillingGetBalanceParams < CheckoutIntents::Internal::Type::BaseModel
      extend CheckoutIntents::Internal::Type::RequestParameters::Converter
      include CheckoutIntents::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            CheckoutIntents::BillingGetBalanceParams,
            CheckoutIntents::Internal::AnyHash
          )
        end

      sig do
        params(
          request_options: CheckoutIntents::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(request_options: {})
      end

      sig do
        override.returns({ request_options: CheckoutIntents::RequestOptions })
      end
      def to_hash
      end
    end
  end
end
>>>>>>> 59fce0d (chore(internal): improvements)
