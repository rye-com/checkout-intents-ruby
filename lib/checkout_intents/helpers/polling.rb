# frozen_string_literal: true

module CheckoutIntents
  module Helpers
    # @api private
    #
    # Core polling logic for checkout intents. Extracted from the resource class
    # to keep the Stainless-generated file free of custom implementation details.
    module Polling
      module_function

      # @return [Float]
      DEFAULT_POLL_INTERVAL = 5.0

      # @return [Integer]
      DEFAULT_MAX_ATTEMPTS = 120

      # @return [Proc]
      COMPLETED = ->(intent) { [:completed, :failed].include?(intent.state) }

      # @return [Proc]
      AWAITING_CONFIRMATION = ->(intent) { [:awaiting_confirmation, :failed].include?(intent.state) }

      # Poll a checkout intent until the given condition is met.
      #
      # @param client [CheckoutIntents::Client] The API client instance
      # @param id [String] The checkout intent ID to poll
      # @param condition [Proc] A callable that receives the intent and returns true when polling should stop
      # @param poll_interval [Float] Seconds between polling attempts
      # @param max_attempts [Integer] Maximum number of polling attempts
      # @param request_options [Hash{Symbol=>Object}, nil] Additional request options
      #
      # @return [CheckoutIntents::Models::CheckoutIntent]
      #
      # @raise [CheckoutIntents::Errors::PollTimeoutError] If max attempts reached without the condition being met
      def poll_until(client, id, condition, poll_interval:, max_attempts:, request_options:)
        if max_attempts < 1
          warn(
            "[Checkout Intents SDK] Invalid max_attempts value: #{max_attempts}. " \
            "max_attempts must be >= 1. Defaulting to 1."
          )
          max_attempts = 1
        end

        attempts = 0
        poll_headers = {
          "x-stainless-poll-helper" => "true",
          "x-stainless-custom-poll-interval" => (poll_interval * 1000).to_i.to_s
        }

        merged_options = (request_options || {}).merge(
          extra_headers: ((request_options || {})[:extra_headers] || {}).merge(poll_headers)
        )

        while attempts < max_attempts
          result = client.request_with_headers(
            method: :get,
            path: ["api/v1/checkout-intents/%1$s", id],
            model: ::CheckoutIntents::CheckoutIntent,
            options: merged_options
          )

          intent = result[:data]
          headers = result[:headers]

          return intent if condition.call(intent)

          attempts += 1

          if attempts >= max_attempts
            raise ::CheckoutIntents::Errors::PollTimeoutError.new(
              intent_id: id,
              attempts: attempts,
              poll_interval: poll_interval,
              max_attempts: max_attempts
            )
          end

          # Check for server-suggested polling interval
          sleep_interval = poll_interval
          if (header_interval = headers["retry-after-ms"])
            header_interval_ms = Integer(header_interval, exception: false)
            sleep_interval = header_interval_ms / 1000.0 if header_interval_ms
          end

          sleep(sleep_interval)
        end
      end
    end
  end
end
