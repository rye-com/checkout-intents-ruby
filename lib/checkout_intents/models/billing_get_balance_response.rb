<<<<<<< HEAD
# frozen_string_literal: true

module CheckoutIntents
  module Models
    # @see ::CheckoutIntents::Resources::Billing#get_balance
    class BillingGetBalanceResponse < ::CheckoutIntents::Internal::Type::BaseModel
      # @!attribute balance
      #
      #   @return [::CheckoutIntents::Models::Money]
      required :balance, -> { ::CheckoutIntents::Money }

      # @!method initialize(balance:)
      #   @param balance [::CheckoutIntents::Models::Money]
    end
  end
end
||||||| parent of 59fce0d (chore(internal): improvements)
=======
# frozen_string_literal: true

module CheckoutIntents
  module Models
    # @see CheckoutIntents::Resources::Billing#get_balance
    class BillingGetBalanceResponse < CheckoutIntents::Internal::Type::BaseModel
      # @!attribute balance
      #
      #   @return [CheckoutIntents::Models::Money]
      required :balance, -> { CheckoutIntents::Money }

      # @!method initialize(balance:)
      #   @param balance [CheckoutIntents::Models::Money]
    end
  end
end
>>>>>>> 59fce0d (chore(internal): improvements)
