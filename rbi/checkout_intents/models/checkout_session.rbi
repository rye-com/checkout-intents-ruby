# typed: strong

module CheckoutIntents
  module Models
    class CheckoutSession < ::CheckoutIntents::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ::CheckoutIntents::CheckoutSession,
            ::CheckoutIntents::Internal::AnyHash
          )
        end

      # URL to send your user to for checkout. This URL is valid for 4 hours.
      sig { returns(String) }
      attr_accessor :url

      # A checkout session represents a hosted checkout form that shoppers can use to
      # complete their purchases.
      #
      # Checkout sessions provide a pre-built UI for collecting payment and shipping
      # information, allowing you to quickly integrate checkout functionality without
      # building your own forms.
      sig { params(url: String).returns(T.attached_class) }
      def self.new(
        # URL to send your user to for checkout. This URL is valid for 4 hours.
        url:
      )
      end

      sig { override.returns({ url: String }) }
      def to_hash
      end
    end
  end
end
