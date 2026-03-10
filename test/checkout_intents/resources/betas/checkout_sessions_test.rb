# frozen_string_literal: true

require_relative "../../test_helper"

class CheckoutIntents::Test::Resources::Betas::CheckoutSessionsTest < CheckoutIntents::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @checkout_intents.betas.checkout_sessions.create(
        product_url: "https://www.amazon.com/dp/B0DFC9MT8Q",
        quantity: 1
      )

    assert_pattern do
      response => CheckoutIntents::CheckoutSession
    end

    assert_pattern do
      response => {
        url: String
      }
    end
  end
end
