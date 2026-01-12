# frozen_string_literal: true

module CheckoutIntents
  module Resources
    class Betas
      class CheckoutSessions
        # Some parameter documentations has been truncated, see
        # {::CheckoutIntents::Models::Betas::CheckoutSessionCreateParams} for more details.
        #
        # Create a new checkout session.
        #
        # Checkout sessions are hosted checkout forms your shoppers can use to complete
        # their purchases.
        #
        # @overload create(product_url:, quantity:, buyer: nil, constraints: nil, promo_codes: nil, variant_selections: nil, request_options: {})
        #
        # @param product_url [String]
        #
        # @param quantity [Integer]
        #
        # @param buyer [::CheckoutIntents::Models::Betas::CheckoutSessionCreateParams::Buyer] Optional buyer information, used to pre-fill the checkout form with the buyer's
        #
        # @param constraints [::CheckoutIntents::Models::Betas::CheckoutSessionCreateParams::Constraints]
        #
        # @param promo_codes [Array<String>]
        #
        # @param variant_selections [Array<::CheckoutIntents::Models::VariantSelection>]
        #
        # @param request_options [::CheckoutIntents::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [::CheckoutIntents::Models::CheckoutSession]
        #
        # @see ::CheckoutIntents::Models::Betas::CheckoutSessionCreateParams
        def create(params)
          parsed, options = ::CheckoutIntents::Betas::CheckoutSessionCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "api/v1/betas/checkout-sessions",
            body: parsed,
            model: ::CheckoutIntents::CheckoutSession,
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
end
