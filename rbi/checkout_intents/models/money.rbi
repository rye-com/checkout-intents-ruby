# typed: strong

module CheckoutIntents
  module Models
    class Money < CheckoutIntents::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(CheckoutIntents::Money, CheckoutIntents::Internal::AnyHash)
        end

      sig { returns(Float) }
      attr_accessor :amount_subunits

      sig { returns(String) }
      attr_accessor :currency_code

      sig do
        params(amount_subunits: Float, currency_code: String).returns(
          T.attached_class
        )
      end
      def self.new(amount_subunits:, currency_code:)
      end

      sig do
        override.returns({ amount_subunits: Float, currency_code: String })
      end
      def to_hash
      end
    end
  end
end
