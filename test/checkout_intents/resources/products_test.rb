# frozen_string_literal: true

require_relative "../test_helper"

class CheckoutIntents::Test::Resources::ProductsTest < CheckoutIntents::Test::ResourceTest
  def test_lookup_required_params
    skip("Mock server tests are disabled")

    response = @checkout_intents.products.lookup(url: "url")

    assert_pattern do
      response => CheckoutIntents::Product
    end

    assert_pattern do
      response => {
        id: String,
        availability: CheckoutIntents::ProductAvailability,
        brand: String | nil,
        description: String | nil,
        images: ^(CheckoutIntents::Internal::Type::ArrayOf[CheckoutIntents::ProductImage]),
        is_purchasable: CheckoutIntents::Internal::Type::Boolean,
        name: String,
        price: CheckoutIntents::Money,
        sku: String | nil,
        url: String,
        variant_dimensions: ^(CheckoutIntents::Internal::Type::ArrayOf[CheckoutIntents::VariantDimension]) | nil,
        variants: ^(CheckoutIntents::Internal::Type::ArrayOf[CheckoutIntents::ProductVariant]) | nil
      }
    end
  end
end
