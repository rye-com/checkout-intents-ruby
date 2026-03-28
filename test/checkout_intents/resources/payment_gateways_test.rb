# frozen_string_literal: true

require_relative "../test_helper"

class CheckoutIntents::Test::Resources::PaymentGatewaysTest < CheckoutIntents::Test::ResourceTest
  def test_create_session
    skip("Mock server tests are disabled")

    response = @checkout_intents.payment_gateways.create_session(:"basis-theory")

    assert_pattern do
      response => ::CheckoutIntents::PaymentGatewaySession
    end

    assert_pattern do
      response => {
        container: String,
        gateway: ::CheckoutIntents::PaymentGatewaySession::Gateway,
        session_key: String
      }
    end
  end
end
