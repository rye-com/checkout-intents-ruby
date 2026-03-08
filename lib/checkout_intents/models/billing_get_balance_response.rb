# frozen_string_literal: true

module CheckoutIntents
  module Models
    # @see CheckoutIntents::Resources::Billing#get_balance
    class BillingGetBalanceResponse < CheckoutIntents::Internal::Type::BaseModel
      # @!attribute balance
      #
      #   @return [CheckoutIntents::Models::Money]
      required :balance, -> { CheckoutIntents::Money }

      # @!attribute drawdown_enabled
      #
      #   @return [Boolean]
      required :drawdown_enabled, CheckoutIntents::Internal::Type::Boolean, api_name: :drawdownEnabled

      # @!method initialize(balance:, drawdown_enabled:)
      #   @param balance [CheckoutIntents::Models::Money]
      #   @param drawdown_enabled [Boolean]
    end
  end
end
