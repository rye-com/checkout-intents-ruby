# frozen_string_literal: true

module CheckoutIntents
  module Resources
    class Products
      # Lookup a product's information by URL.
      #
      # @overload lookup(url:, request_options: {})
      #
      # @param url [String]
      # @param request_options [::CheckoutIntents::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [::CheckoutIntents::Models::Product]
      #
      # @see ::CheckoutIntents::Models::ProductLookupParams
      def lookup(params)
        parsed, options = ::CheckoutIntents::ProductLookupParams.dump_request(params)
        query = ::CheckoutIntents::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "api/v1/products/lookup",
          query: query,
          model: ::CheckoutIntents::Product,
          options: options
        )
      end

      # @api private
      #
      # @param client [::CheckoutIntents::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
