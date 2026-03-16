# frozen_string_literal: true

module CheckoutIntents
  module Resources
    class Betas
      # @return [::CheckoutIntents::Resources::Betas::CheckoutSessions]
      attr_reader :checkout_sessions

      # @api private
      #
      # @param client [::CheckoutIntents::Client]
      def initialize(client:)
        @client = client
        @checkout_sessions = ::CheckoutIntents::Resources::Betas::CheckoutSessions.new(client: client)
      end
    end
  end
end
