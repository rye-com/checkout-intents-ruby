# frozen_string_literal: true

module CheckoutIntents
  module Resources
    class Brands
      # Retrieve brand information by domain name
      #
      # Look up a brand by its domain name (e.g. "aloyoga.com" or "www.amazon.com").
      # Returns brand information including the marketplace type if the lookup succeeds.
      #
      # @overload retrieve(domain, request_options: {})
      #
      # @param domain [String] Represents a valid domain name string.
      #
      # @param request_options [::CheckoutIntents::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [::CheckoutIntents::Models::BrandRetrieveResponse]
      #
      # @see ::CheckoutIntents::Models::BrandRetrieveParams
      def retrieve(domain, params = {})
        @client.request(
          method: :get,
          path: ["api/v1/brands/domain/%1$s", domain],
          model: ::CheckoutIntents::Models::BrandRetrieveResponse,
          options: params[:request_options]
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
