<<<<<<< HEAD
# frozen_string_literal: true

module CheckoutIntents
  module Resources
    class Billing
      # Get current drawdown balance for the authenticated developer
      #
      # @overload get_balance(request_options: {})
      #
      # @param request_options [::CheckoutIntents::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [::CheckoutIntents::Models::BillingGetBalanceResponse]
      #
      # @see ::CheckoutIntents::Models::BillingGetBalanceParams
      def get_balance(params = {})
        @client.request(
          method: :get,
          path: "api/v1/billing/balance",
          model: ::CheckoutIntents::Models::BillingGetBalanceResponse,
          options: params[:request_options]
        )
      end

      # List drawdown balance transactions for the authenticated developer
      #
      # @overload list_transactions(after: nil, before: nil, limit: nil, request_options: {})
      #
      # @param after [String] Cursor for forward pagination (transaction ID to start after)
      #
      # @param before [String] Cursor for backward pagination (transaction ID to end before)
      #
      # @param limit [Integer] Maximum number of transactions to return (default 20)
      #
      # @param request_options [::CheckoutIntents::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [::CheckoutIntents::Internal::CursorPagination<::CheckoutIntents::Models::BillingListTransactionsResponse>]
      #
      # @see ::CheckoutIntents::Models::BillingListTransactionsParams
      def list_transactions(params = {})
        parsed, options = ::CheckoutIntents::BillingListTransactionsParams.dump_request(params)
        @client.request(
          method: :get,
          path: "api/v1/billing/transactions",
          query: parsed,
          page: ::CheckoutIntents::Internal::CursorPagination,
          model: ::CheckoutIntents::Models::BillingListTransactionsResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [::CheckoutIntents::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
||||||| parent of 59fce0d (chore(internal): improvements)
=======
# frozen_string_literal: true

module CheckoutIntents
  module Resources
    class Billing
      # Get current drawdown balance for the authenticated developer
      #
      # @overload get_balance(request_options: {})
      #
      # @param request_options [CheckoutIntents::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [CheckoutIntents::Models::BillingGetBalanceResponse]
      #
      # @see CheckoutIntents::Models::BillingGetBalanceParams
      def get_balance(params = {})
        @client.request(
          method: :get,
          path: "api/v1/billing/balance",
          model: CheckoutIntents::Models::BillingGetBalanceResponse,
          options: params[:request_options]
        )
      end

      # List drawdown balance transactions for the authenticated developer
      #
      # @overload list_transactions(after: nil, before: nil, limit: nil, request_options: {})
      #
      # @param after [String] Cursor for forward pagination (transaction ID to start after)
      #
      # @param before [String] Cursor for backward pagination (transaction ID to end before)
      #
      # @param limit [Integer] Maximum number of transactions to return (default 20)
      #
      # @param request_options [CheckoutIntents::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [CheckoutIntents::Internal::CursorPagination<CheckoutIntents::Models::BillingListTransactionsResponse>]
      #
      # @see CheckoutIntents::Models::BillingListTransactionsParams
      def list_transactions(params = {})
        parsed, options = CheckoutIntents::BillingListTransactionsParams.dump_request(params)
        @client.request(
          method: :get,
          path: "api/v1/billing/transactions",
          query: parsed,
          page: CheckoutIntents::Internal::CursorPagination,
          model: CheckoutIntents::Models::BillingListTransactionsResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [CheckoutIntents::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
>>>>>>> 59fce0d (chore(internal): improvements)
