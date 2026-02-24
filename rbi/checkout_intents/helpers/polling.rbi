# typed: strong

module CheckoutIntents
  module Helpers
    module Polling
      DEFAULT_POLL_INTERVAL = T.let(5.0, Float)

      DEFAULT_MAX_ATTEMPTS = T.let(120, Integer)

      COMPLETED =
        T.let(
          T.unsafe(nil),
          T
            .proc
            .params(intent: ::CheckoutIntents::CheckoutIntent::Variants)
            .returns(T::Boolean)
        )

      AWAITING_CONFIRMATION =
        T.let(
          T.unsafe(nil),
          T
            .proc
            .params(intent: ::CheckoutIntents::CheckoutIntent::Variants)
            .returns(T::Boolean)
        )

      # Poll a checkout intent until the given condition is met.
      sig do
        params(
          client: ::CheckoutIntents::Client,
          id: String,
          condition:
            T
              .proc
              .params(intent: ::CheckoutIntents::CheckoutIntent::Variants)
              .returns(T::Boolean),
          poll_interval: Float,
          max_attempts: Integer,
          request_options: ::CheckoutIntents::RequestOptions::OrHash
        ).returns(::CheckoutIntents::CheckoutIntent::Variants)
      end
      def self.poll_until(
        client,
        id,
        condition,
        poll_interval:,
        max_attempts:,
        request_options:
      )
      end
    end
  end
end
