# frozen_string_literal: true

module CheckoutIntents
  class Client < CheckoutIntents::Internal::Transport::BaseClient
    # Default max number of retries to attempt after a failed retryable request.
    DEFAULT_MAX_RETRIES = 2

    # Default per-request timeout.
    DEFAULT_TIMEOUT_IN_SECONDS = 60.0

    # Default initial retry delay in seconds.
    # Overall delay is calculated using exponential backoff + jitter.
    DEFAULT_INITIAL_RETRY_DELAY = 0.5

    # Default max retry delay in seconds.
    DEFAULT_MAX_RETRY_DELAY = 8.0

    # rubocop:disable Style/MutableConstant
    # @type [Hash{Symbol=>String}]
    ENVIRONMENTS = {staging: "https://staging.api.rye.com/", production: "https://api.rye.com/"}
    # rubocop:enable Style/MutableConstant

    # Rye API key. Format: `RYE/{environment}-abcdef`
    # @return [String]
    attr_reader :api_key

    # @return [CheckoutIntents::Resources::CheckoutIntents]
    attr_reader :checkout_intents

    # @return [CheckoutIntents::Resources::Betas]
    attr_reader :betas

    # @return [CheckoutIntents::Resources::Brands]
    attr_reader :brands

    # @api private
    #
    # @return [Hash{String=>String}]
    private def auth_headers
      return {} if @api_key.nil?

      {"authorization" => "Bearer #{@api_key}"}
    end

    # Creates and returns a new client for interacting with the API.
    #
    # @param api_key [String, nil] Rye API key. Format: `RYE/{environment}-abcdef` Defaults to
    # `ENV["CHECKOUT_INTENTS_API_KEY"]`
    #
    # @param environment [:staging, :production, nil] Specifies the environment to use for the API.
    #
    # Each environment maps to a different base URL:
    #
    # - `staging` corresponds to `https://staging.api.rye.com/`
    # - `production` corresponds to `https://api.rye.com/`
    #
    # @param base_url [String, nil] Override the default base URL for the API, e.g.,
    # `"https://api.example.com/v2/"`. Defaults to `ENV["CHECKOUT_INTENTS_BASE_URL"]`
    #
    # @param max_retries [Integer] Max number of retries to attempt after a failed retryable request.
    #
    # @param timeout [Float]
    #
    # @param initial_retry_delay [Float]
    #
    # @param max_retry_delay [Float]
    def initialize(
      api_key: ENV["CHECKOUT_INTENTS_API_KEY"],
      environment: nil,
      base_url: ENV["CHECKOUT_INTENTS_BASE_URL"],
      max_retries: self.class::DEFAULT_MAX_RETRIES,
      timeout: self.class::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: self.class::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: self.class::DEFAULT_MAX_RETRY_DELAY
    )
      base_url ||= CheckoutIntents::Client::ENVIRONMENTS.fetch(environment&.to_sym || :production) do
        message = "environment must be one of #{CheckoutIntents::Client::ENVIRONMENTS.keys}, got #{environment}"
        raise ArgumentError.new(message)
      end

      if api_key.nil?
        raise ArgumentError.new("api_key is required, and can be set via environ: \"CHECKOUT_INTENTS_API_KEY\"")
      end

      @api_key = api_key.to_s

      super(
        base_url: base_url,
        timeout: timeout,
        max_retries: max_retries,
        initial_retry_delay: initial_retry_delay,
        max_retry_delay: max_retry_delay
      )

      @checkout_intents = CheckoutIntents::Resources::CheckoutIntents.new(client: self)
      @betas = CheckoutIntents::Resources::Betas.new(client: self)
      @brands = CheckoutIntents::Resources::Brands.new(client: self)
    end
  end
end
