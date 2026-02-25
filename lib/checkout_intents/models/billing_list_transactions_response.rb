# frozen_string_literal: true

module CheckoutIntents
  module Models
    # @see CheckoutIntents::Resources::Billing#list_transactions
    class BillingListTransactionsResponse < CheckoutIntents::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute amount
      #
      #   @return [CheckoutIntents::Models::Money]
      required :amount, -> { CheckoutIntents::Money }

      # @!attribute created_at
      #
      #   @return [Time]
      required :created_at, Time, api_name: :createdAt

      # @!attribute description
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute metadata
      #   Construct a type with a set of properties K of type T
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :metadata, CheckoutIntents::Internal::Type::HashOf[String]

      # @!method initialize(id:, amount:, created_at:, description: nil, metadata: nil)
      #   @param id [String]
      #
      #   @param amount [CheckoutIntents::Models::Money]
      #
      #   @param created_at [Time]
      #
      #   @param description [String]
      #
      #   @param metadata [Hash{Symbol=>String}] Construct a type with a set of properties K of type T
    end
  end
end
