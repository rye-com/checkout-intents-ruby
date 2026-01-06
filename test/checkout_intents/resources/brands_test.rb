# frozen_string_literal: true

require_relative "../test_helper"

class CheckoutIntents::Test::Resources::BrandsTest < CheckoutIntents::Test::ResourceTest
  def test_retrieve
    skip("Prism tests are disabled")

    response = @checkout_intents.brands.retrieve("shop.aloyoga.com")

    assert_pattern do
      response => CheckoutIntents::Models::BrandRetrieveResponse
    end

    assert_pattern do
      response => {
        id: String,
        marketplace: CheckoutIntents::Models::BrandRetrieveResponse::Marketplace,
        supported: CheckoutIntents::Internal::Type::Boolean
      }
    end
  end
end
