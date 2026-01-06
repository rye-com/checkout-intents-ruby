# typed: strong

module CheckoutIntents
  module Resources
    class Brands
      # Retrieve brand information by domain name
      #
      # Look up a brand by its domain name (e.g. "aloyoga.com" or "www.amazon.com").
      # Returns brand information including the marketplace type if the lookup succeeds.
      sig do
        params(
          domain: String,
          request_options: CheckoutIntents::RequestOptions::OrHash
        ).returns(CheckoutIntents::Models::BrandRetrieveResponse)
      end
      def retrieve(
        # Represents a valid domain name string.
        domain,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: CheckoutIntents::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
