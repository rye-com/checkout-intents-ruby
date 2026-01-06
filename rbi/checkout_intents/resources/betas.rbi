# typed: strong

module CheckoutIntents
  module Resources
    class Betas
      sig { returns(CheckoutIntents::Resources::Betas::CheckoutSessions) }
      attr_reader :checkout_sessions

      # @api private
      sig { params(client: CheckoutIntents::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
