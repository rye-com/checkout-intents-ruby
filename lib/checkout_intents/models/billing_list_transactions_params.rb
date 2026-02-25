# frozen_string_literal: true

module CheckoutIntents
  module Models
    # @see CheckoutIntents::Resources::Billing#list_transactions
    class BillingListTransactionsParams < CheckoutIntents::Internal::Type::BaseModel
      extend CheckoutIntents::Internal::Type::RequestParameters::Converter
      include CheckoutIntents::Internal::Type::RequestParameters

      # @!attribute after
      #   Cursor for forward pagination (transaction ID to start after)
      #
      #   @return [String, nil]
      optional :after, String

      # @!attribute before
      #   Cursor for backward pagination (transaction ID to end before)
      #
      #   @return [String, nil]
      optional :before, String

      # @!attribute limit
      #   Maximum number of transactions to return (default 20)
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!method initialize(after: nil, before: nil, limit: nil, request_options: {})
      #   @param after [String] Cursor for forward pagination (transaction ID to start after)
      #
      #   @param before [String] Cursor for backward pagination (transaction ID to end before)
      #
      #   @param limit [Integer] Maximum number of transactions to return (default 20)
      #
      #   @param request_options [CheckoutIntents::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
