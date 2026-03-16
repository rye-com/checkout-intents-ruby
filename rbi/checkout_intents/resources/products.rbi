# typed: strong

module CheckoutIntents
  module Resources
    class Products
      # Lookup a product's information by URL.
      sig do
        params(
          url: String,
          request_options: ::CheckoutIntents::RequestOptions::OrHash
        ).returns(::CheckoutIntents::Product)
      end
      def lookup(url:, request_options: {})
      end

      # @api private
      sig do
        params(client: ::CheckoutIntents::Client).returns(T.attached_class)
      end
      def self.new(client:)
      end
    end
  end
end
