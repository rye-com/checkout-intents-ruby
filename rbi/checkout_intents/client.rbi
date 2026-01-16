# typed: strong

module CheckoutIntents
  class Client < CheckoutIntents::Internal::Transport::BaseClient
    DEFAULT_MAX_RETRIES = 2

    DEFAULT_TIMEOUT_IN_SECONDS = T.let(60.0, Float)

    DEFAULT_INITIAL_RETRY_DELAY = T.let(0.5, Float)

    DEFAULT_MAX_RETRY_DELAY = T.let(8.0, Float)

    ENVIRONMENTS =
      T.let(
        {
          staging: "https://staging.api.rye.com/",
          production: "https://api.rye.com/"
        },
        T::Hash[Symbol, String]
      )

    # Rye API key. Format: `RYE/{environment}-abcdef`
    sig { returns(String) }
    attr_reader :api_key

    sig { returns(CheckoutIntents::Resources::CheckoutIntents) }
    attr_reader :checkout_intents

    sig { returns(CheckoutIntents::Resources::Betas) }
    attr_reader :betas

    sig { returns(CheckoutIntents::Resources::Brands) }
    attr_reader :brands

    # @api private
    sig { override.returns(T::Hash[String, String]) }
    private def auth_headers
    end

    # Creates and returns a new client for interacting with the API.
    sig do
      params(
        api_key: T.nilable(String),
        environment: T.nilable(T.any(Symbol, String)),
        base_url: T.nilable(String),
        max_retries: Integer,
        timeout: Float,
        initial_retry_delay: Float,
        max_retry_delay: Float,
        idempotency_header: String
      ).returns(T.attached_class)
    end
    def self.new(
      # Rye API key. Format: `RYE/{environment}-abcdef` Defaults to
      # `ENV["CHECKOUT_INTENTS_API_KEY"]`
      api_key: ENV["CHECKOUT_INTENTS_API_KEY"],
      # Specifies the environment to use for the API.
      #
      # Each environment maps to a different base URL:
      #
      # - `staging` corresponds to `https://staging.api.rye.com/`
      # - `production` corresponds to `https://api.rye.com/`
      environment: nil,
      # Override the default base URL for the API, e.g.,
      # `"https://api.example.com/v2/"`. Defaults to `ENV["CHECKOUT_INTENTS_BASE_URL"]`
      base_url: ENV["CHECKOUT_INTENTS_BASE_URL"],
      # Max number of retries to attempt after a failed retryable request.
      max_retries: CheckoutIntents::Client::DEFAULT_MAX_RETRIES,
      timeout: CheckoutIntents::Client::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: CheckoutIntents::Client::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: CheckoutIntents::Client::DEFAULT_MAX_RETRY_DELAY,
      idempotency_header: "Idempotency-Key"
    )
    end
  end
end
