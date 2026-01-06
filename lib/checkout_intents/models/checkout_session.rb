# frozen_string_literal: true

module CheckoutIntents
  module Models
    class CheckoutSession < CheckoutIntents::Internal::Type::BaseModel
      # @!attribute url
      #   URL to send your user to for checkout. This URL is valid for 4 hours.
      #
      #   @return [String]
      required :url, String

      # @!method initialize(url:)
      #   A checkout session represents a hosted checkout form that shoppers can use to
      #   complete their purchases.
      #
      #   Checkout sessions provide a pre-built UI for collecting payment and shipping
      #   information, allowing you to quickly integrate checkout functionality without
      #   building your own forms.
      #
      #   @param url [String] URL to send your user to for checkout. This URL is valid for 4 hours.
    end
  end
end
