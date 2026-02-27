<<<<<<< HEAD
# typed: strong

module CheckoutIntents
  module Resources
    class Billing
      # Get current drawdown balance for the authenticated developer
      sig do
        params(
          request_options: ::CheckoutIntents::RequestOptions::OrHash
        ).returns(::CheckoutIntents::Models::BillingGetBalanceResponse)
      end
      def get_balance(request_options: {})
      end

      # List drawdown balance transactions for the authenticated developer
      sig do
        params(
          after: String,
          before: String,
          limit: Integer,
          request_options: ::CheckoutIntents::RequestOptions::OrHash
        ).returns(
          ::CheckoutIntents::Internal::CursorPagination[
            ::CheckoutIntents::Models::BillingListTransactionsResponse
          ]
        )
      end
      def list_transactions(
        # Cursor for forward pagination (transaction ID to start after)
        after: nil,
        # Cursor for backward pagination (transaction ID to end before)
        before: nil,
        # Maximum number of transactions to return (default 20)
        limit: nil,
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
||||||| parent of 59fce0d (chore(internal): improvements)
=======
# typed: strong

module CheckoutIntents
  module Resources
    class Billing
      # Get current drawdown balance for the authenticated developer
      sig do
        params(
          request_options: CheckoutIntents::RequestOptions::OrHash
        ).returns(CheckoutIntents::Models::BillingGetBalanceResponse)
      end
      def get_balance(request_options: {})
      end

      # List drawdown balance transactions for the authenticated developer
      sig do
        params(
          after: String,
          before: String,
          limit: Integer,
          request_options: CheckoutIntents::RequestOptions::OrHash
        ).returns(
          CheckoutIntents::Internal::CursorPagination[
            CheckoutIntents::Models::BillingListTransactionsResponse
          ]
        )
      end
      def list_transactions(
        # Cursor for forward pagination (transaction ID to start after)
        after: nil,
        # Cursor for backward pagination (transaction ID to end before)
        before: nil,
        # Maximum number of transactions to return (default 20)
        limit: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: CheckoutIntents::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
>>>>>>> 59fce0d (chore(internal): improvements)
