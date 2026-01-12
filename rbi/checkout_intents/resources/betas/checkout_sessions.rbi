# typed: strong

module CheckoutIntents
  module Resources
    class Betas
      class CheckoutSessions
        # Create a new checkout session.
        #
        # Checkout sessions are hosted checkout forms your shoppers can use to complete
        # their purchases.
        sig do
          params(
            product_url: String,
            quantity: Integer,
            buyer:
              ::CheckoutIntents::Betas::CheckoutSessionCreateParams::Buyer::OrHash,
            constraints:
              ::CheckoutIntents::Betas::CheckoutSessionCreateParams::Constraints::OrHash,
            promo_codes: T::Array[String],
            variant_selections:
              T::Array[::CheckoutIntents::VariantSelection::OrHash],
            request_options: ::CheckoutIntents::RequestOptions::OrHash
          ).returns(::CheckoutIntents::CheckoutSession)
        end
        def create(
          product_url:,
          quantity:,
          # Optional buyer information, used to pre-fill the checkout form with the buyer's
          # information.
          buyer: nil,
          constraints: nil,
          promo_codes: nil,
          variant_selections: nil,
          request_options: {}
        )
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
end
