# frozen_string_literal: true

require_relative "../test_helper"

class CheckoutIntents::Test::Resources::CheckoutIntentsTest < CheckoutIntents::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response =
      @checkout_intents.checkout_intents.create(
        buyer: {
          address1: "123 Main St",
          city: "New York",
          country: "US",
          email: "john.doe@example.com",
          firstName: "John",
          lastName: "Doe",
          phone: "1234567890",
          postalCode: "10001",
          province: "NY"
        },
        product_url: "productUrl",
        quantity: 1
      )

    assert_pattern do
      response => CheckoutIntents::CheckoutIntent
    end

    assert_pattern do
      case response
      in CheckoutIntents::CheckoutIntent::RetrievingOfferCheckoutIntent
      in CheckoutIntents::CheckoutIntent::AwaitingConfirmationCheckoutIntent
      in CheckoutIntents::CheckoutIntent::PlacingOrderCheckoutIntent
      in CheckoutIntents::CheckoutIntent::CompletedCheckoutIntent
      in CheckoutIntents::CheckoutIntent::FailedCheckoutIntent
      end
    end
  end

  def test_retrieve
    skip("Prism tests are disabled")

    response = @checkout_intents.checkout_intents.retrieve("id")

    assert_pattern do
      response => CheckoutIntents::CheckoutIntent
    end

    assert_pattern do
      case response
      in CheckoutIntents::CheckoutIntent::RetrievingOfferCheckoutIntent
      in CheckoutIntents::CheckoutIntent::AwaitingConfirmationCheckoutIntent
      in CheckoutIntents::CheckoutIntent::PlacingOrderCheckoutIntent
      in CheckoutIntents::CheckoutIntent::CompletedCheckoutIntent
      in CheckoutIntents::CheckoutIntent::FailedCheckoutIntent
      end
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @checkout_intents.checkout_intents.list

    assert_pattern do
      response => CheckoutIntents::Internal::CursorPagination
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => CheckoutIntents::CheckoutIntent
    end

    assert_pattern do
      case row
      in CheckoutIntents::CheckoutIntent::RetrievingOfferCheckoutIntent
      in CheckoutIntents::CheckoutIntent::AwaitingConfirmationCheckoutIntent
      in CheckoutIntents::CheckoutIntent::PlacingOrderCheckoutIntent
      in CheckoutIntents::CheckoutIntent::CompletedCheckoutIntent
      in CheckoutIntents::CheckoutIntent::FailedCheckoutIntent
      end
    end
  end

  def test_add_payment_required_params
    skip("Prism tests are disabled")

    response =
      @checkout_intents.checkout_intents.add_payment(
        "id",
        payment_method: {stripeToken: "tok_1RkrWWHGDlstla3f1Fc7ZrhH", type: :stripe_token}
      )

    assert_pattern do
      response => CheckoutIntents::CheckoutIntent
    end

    assert_pattern do
      case response
      in CheckoutIntents::CheckoutIntent::RetrievingOfferCheckoutIntent
      in CheckoutIntents::CheckoutIntent::AwaitingConfirmationCheckoutIntent
      in CheckoutIntents::CheckoutIntent::PlacingOrderCheckoutIntent
      in CheckoutIntents::CheckoutIntent::CompletedCheckoutIntent
      in CheckoutIntents::CheckoutIntent::FailedCheckoutIntent
      end
    end
  end

  def test_confirm_required_params
    skip("Prism tests are disabled")

    response =
      @checkout_intents.checkout_intents.confirm(
        "id",
        payment_method: {stripeToken: "tok_1RkrWWHGDlstla3f1Fc7ZrhH", type: :stripe_token}
      )

    assert_pattern do
      response => CheckoutIntents::CheckoutIntent
    end

    assert_pattern do
      case response
      in CheckoutIntents::CheckoutIntent::RetrievingOfferCheckoutIntent
      in CheckoutIntents::CheckoutIntent::AwaitingConfirmationCheckoutIntent
      in CheckoutIntents::CheckoutIntent::PlacingOrderCheckoutIntent
      in CheckoutIntents::CheckoutIntent::CompletedCheckoutIntent
      in CheckoutIntents::CheckoutIntent::FailedCheckoutIntent
      end
    end
  end

  def test_purchase_required_params
    skip("Prism tests are disabled")

    response =
      @checkout_intents.checkout_intents.purchase(
        buyer: {
          address1: "123 Main St",
          city: "New York",
          country: "US",
          email: "john.doe@example.com",
          firstName: "John",
          lastName: "Doe",
          phone: "1234567890",
          postalCode: "10001",
          province: "NY"
        },
        payment_method: {stripeToken: "tok_1RkrWWHGDlstla3f1Fc7ZrhH", type: :stripe_token},
        product_url: "productUrl",
        quantity: 1
      )

    assert_pattern do
      response => CheckoutIntents::CheckoutIntent
    end

    assert_pattern do
      case response
      in CheckoutIntents::CheckoutIntent::RetrievingOfferCheckoutIntent
      in CheckoutIntents::CheckoutIntent::AwaitingConfirmationCheckoutIntent
      in CheckoutIntents::CheckoutIntent::PlacingOrderCheckoutIntent
      in CheckoutIntents::CheckoutIntent::CompletedCheckoutIntent
      in CheckoutIntents::CheckoutIntent::FailedCheckoutIntent
      end
    end
  end
end
