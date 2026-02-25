# frozen_string_literal: true

require_relative "../test_helper"

class CheckoutIntents::Test::Resources::BillingTest < CheckoutIntents::Test::ResourceTest
  def test_get_balance
    skip("Mock server tests are disabled")

    response = @checkout_intents.billing.get_balance

    assert_pattern do
      response => CheckoutIntents::Models::BillingGetBalanceResponse
    end

    assert_pattern do
      response => {
        balance: CheckoutIntents::Money
      }
    end
  end

  def test_list_transactions
    skip("Mock server tests are disabled")

    response = @checkout_intents.billing.list_transactions

    assert_pattern do
      response => CheckoutIntents::Internal::CursorPagination
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => CheckoutIntents::Models::BillingListTransactionsResponse
    end

    assert_pattern do
      row => {
        id: String,
        amount: CheckoutIntents::Money,
        created_at: Time,
        description: String | nil,
        metadata: ^(CheckoutIntents::Internal::Type::HashOf[String]) | nil
      }
    end
  end
end
