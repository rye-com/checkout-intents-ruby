# frozen_string_literal: true

require_relative "test_helper"

class CheckoutIntentsTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

  def before_all
    super
    WebMock.enable!
  end

  def setup
    super
    Thread.current.thread_variable_set(:mock_sleep, [])
  end

  def teardown
    Thread.current.thread_variable_set(:mock_sleep, nil)
    WebMock.reset!
    super
  end

  def after_all
    WebMock.disable!
    super
  end

  def test_raises_on_unknown_environment
    e = assert_raises(ArgumentError) do
      CheckoutIntents::Client.new(api_key: "test-key", environment: "wrong")
    end

    assert_match(/environment must be one of/, e.message)
  end

  def test_raises_on_missing_non_nullable_opts
    e = assert_raises(ArgumentError) do
      CheckoutIntents::Client.new
    end

    assert_match(/is required/, e.message)
  end

  def test_client_default_request_default_retry_attempts
    stub_request(:post, "http://localhost/api/v1/checkout-intents").to_return_json(status: 500, body: {})

    checkout_intents = CheckoutIntents::Client.new(base_url: "http://localhost", api_key: "My API Key")

    assert_raises(CheckoutIntents::Errors::InternalServerError) do
      checkout_intents.checkout_intents.create(
        buyer: {
          address1: "123 Main St",
          city: "New York",
          country: "US",
          email: "john.doe@example.com",
          firstName: "John",
          lastName: "Doe",
          phone: "1234567890",
          postalCode: "10001",
          province: "NY"
        },
        product_url: "productUrl",
        quantity: 1
      )
    end

    assert_requested(:any, /./, times: 3)
  end

  def test_client_given_request_default_retry_attempts
    stub_request(:post, "http://localhost/api/v1/checkout-intents").to_return_json(status: 500, body: {})

    checkout_intents = CheckoutIntents::Client.new(
      base_url: "http://localhost",
      api_key: "My API Key",
      max_retries: 3
    )

    assert_raises(CheckoutIntents::Errors::InternalServerError) do
      checkout_intents.checkout_intents.create(
        buyer: {
          address1: "123 Main St",
          city: "New York",
          country: "US",
          email: "john.doe@example.com",
          firstName: "John",
          lastName: "Doe",
          phone: "1234567890",
          postalCode: "10001",
          province: "NY"
        },
        product_url: "productUrl",
        quantity: 1
      )
    end

    assert_requested(:any, /./, times: 4)
  end

  def test_client_default_request_given_retry_attempts
    stub_request(:post, "http://localhost/api/v1/checkout-intents").to_return_json(status: 500, body: {})

    checkout_intents = CheckoutIntents::Client.new(base_url: "http://localhost", api_key: "My API Key")

    assert_raises(CheckoutIntents::Errors::InternalServerError) do
      checkout_intents.checkout_intents.create(
        buyer: {
          address1: "123 Main St",
          city: "New York",
          country: "US",
          email: "john.doe@example.com",
          firstName: "John",
          lastName: "Doe",
          phone: "1234567890",
          postalCode: "10001",
          province: "NY"
        },
        product_url: "productUrl",
        quantity: 1,
        request_options: {max_retries: 3}
      )
    end

    assert_requested(:any, /./, times: 4)
  end

  def test_client_given_request_given_retry_attempts
    stub_request(:post, "http://localhost/api/v1/checkout-intents").to_return_json(status: 500, body: {})

    checkout_intents = CheckoutIntents::Client.new(
      base_url: "http://localhost",
      api_key: "My API Key",
      max_retries: 3
    )

    assert_raises(CheckoutIntents::Errors::InternalServerError) do
      checkout_intents.checkout_intents.create(
        buyer: {
          address1: "123 Main St",
          city: "New York",
          country: "US",
          email: "john.doe@example.com",
          firstName: "John",
          lastName: "Doe",
          phone: "1234567890",
          postalCode: "10001",
          province: "NY"
        },
        product_url: "productUrl",
        quantity: 1,
        request_options: {max_retries: 4}
      )
    end

    assert_requested(:any, /./, times: 5)
  end

  def test_client_retry_after_seconds
    stub_request(:post, "http://localhost/api/v1/checkout-intents").to_return_json(
      status: 500,
      headers: {"retry-after" => "1.3"},
      body: {}
    )

    checkout_intents = CheckoutIntents::Client.new(
      base_url: "http://localhost",
      api_key: "My API Key",
      max_retries: 1
    )

    assert_raises(CheckoutIntents::Errors::InternalServerError) do
      checkout_intents.checkout_intents.create(
        buyer: {
          address1: "123 Main St",
          city: "New York",
          country: "US",
          email: "john.doe@example.com",
          firstName: "John",
          lastName: "Doe",
          phone: "1234567890",
          postalCode: "10001",
          province: "NY"
        },
        product_url: "productUrl",
        quantity: 1
      )
    end

    assert_requested(:any, /./, times: 2)
    assert_equal(1.3, Thread.current.thread_variable_get(:mock_sleep).last)
  end

  def test_client_retry_after_date
    stub_request(:post, "http://localhost/api/v1/checkout-intents").to_return_json(
      status: 500,
      headers: {"retry-after" => (Time.now + 10).httpdate},
      body: {}
    )

    checkout_intents = CheckoutIntents::Client.new(
      base_url: "http://localhost",
      api_key: "My API Key",
      max_retries: 1
    )

    assert_raises(CheckoutIntents::Errors::InternalServerError) do
      Thread.current.thread_variable_set(:time_now, Time.now)
      checkout_intents.checkout_intents.create(
        buyer: {
          address1: "123 Main St",
          city: "New York",
          country: "US",
          email: "john.doe@example.com",
          firstName: "John",
          lastName: "Doe",
          phone: "1234567890",
          postalCode: "10001",
          province: "NY"
        },
        product_url: "productUrl",
        quantity: 1
      )
      Thread.current.thread_variable_set(:time_now, nil)
    end

    assert_requested(:any, /./, times: 2)
    assert_in_delta(10, Thread.current.thread_variable_get(:mock_sleep).last, 1.0)
  end

  def test_client_retry_after_ms
    stub_request(:post, "http://localhost/api/v1/checkout-intents").to_return_json(
      status: 500,
      headers: {"retry-after-ms" => "1300"},
      body: {}
    )

    checkout_intents = CheckoutIntents::Client.new(
      base_url: "http://localhost",
      api_key: "My API Key",
      max_retries: 1
    )

    assert_raises(CheckoutIntents::Errors::InternalServerError) do
      checkout_intents.checkout_intents.create(
        buyer: {
          address1: "123 Main St",
          city: "New York",
          country: "US",
          email: "john.doe@example.com",
          firstName: "John",
          lastName: "Doe",
          phone: "1234567890",
          postalCode: "10001",
          province: "NY"
        },
        product_url: "productUrl",
        quantity: 1
      )
    end

    assert_requested(:any, /./, times: 2)
    assert_equal(1.3, Thread.current.thread_variable_get(:mock_sleep).last)
  end

  def test_retry_count_header
    stub_request(:post, "http://localhost/api/v1/checkout-intents").to_return_json(status: 500, body: {})

    checkout_intents = CheckoutIntents::Client.new(base_url: "http://localhost", api_key: "My API Key")

    assert_raises(CheckoutIntents::Errors::InternalServerError) do
      checkout_intents.checkout_intents.create(
        buyer: {
          address1: "123 Main St",
          city: "New York",
          country: "US",
          email: "john.doe@example.com",
          firstName: "John",
          lastName: "Doe",
          phone: "1234567890",
          postalCode: "10001",
          province: "NY"
        },
        product_url: "productUrl",
        quantity: 1
      )
    end

    3.times do
      assert_requested(:any, /./, headers: {"x-stainless-retry-count" => _1})
    end
  end

  def test_omit_retry_count_header
    stub_request(:post, "http://localhost/api/v1/checkout-intents").to_return_json(status: 500, body: {})

    checkout_intents = CheckoutIntents::Client.new(base_url: "http://localhost", api_key: "My API Key")

    assert_raises(CheckoutIntents::Errors::InternalServerError) do
      checkout_intents.checkout_intents.create(
        buyer: {
          address1: "123 Main St",
          city: "New York",
          country: "US",
          email: "john.doe@example.com",
          firstName: "John",
          lastName: "Doe",
          phone: "1234567890",
          postalCode: "10001",
          province: "NY"
        },
        product_url: "productUrl",
        quantity: 1,
        request_options: {extra_headers: {"x-stainless-retry-count" => nil}}
      )
    end

    assert_requested(:any, /./, times: 3) do
      refute_includes(_1.headers.keys.map(&:downcase), "x-stainless-retry-count")
    end
  end

  def test_overwrite_retry_count_header
    stub_request(:post, "http://localhost/api/v1/checkout-intents").to_return_json(status: 500, body: {})

    checkout_intents = CheckoutIntents::Client.new(base_url: "http://localhost", api_key: "My API Key")

    assert_raises(CheckoutIntents::Errors::InternalServerError) do
      checkout_intents.checkout_intents.create(
        buyer: {
          address1: "123 Main St",
          city: "New York",
          country: "US",
          email: "john.doe@example.com",
          firstName: "John",
          lastName: "Doe",
          phone: "1234567890",
          postalCode: "10001",
          province: "NY"
        },
        product_url: "productUrl",
        quantity: 1,
        request_options: {extra_headers: {"x-stainless-retry-count" => "42"}}
      )
    end

    assert_requested(:any, /./, headers: {"x-stainless-retry-count" => "42"}, times: 3)
  end

  def test_client_redirect_307
    stub_request(:post, "http://localhost/api/v1/checkout-intents").to_return_json(
      status: 307,
      headers: {"location" => "/redirected"},
      body: {}
    )
    stub_request(:any, "http://localhost/redirected").to_return(
      status: 307,
      headers: {"location" => "/redirected"}
    )

    checkout_intents = CheckoutIntents::Client.new(base_url: "http://localhost", api_key: "My API Key")

    assert_raises(CheckoutIntents::Errors::APIConnectionError) do
      checkout_intents.checkout_intents.create(
        buyer: {
          address1: "123 Main St",
          city: "New York",
          country: "US",
          email: "john.doe@example.com",
          firstName: "John",
          lastName: "Doe",
          phone: "1234567890",
          postalCode: "10001",
          province: "NY"
        },
        product_url: "productUrl",
        quantity: 1,
        request_options: {extra_headers: {}}
      )
    end

    recorded, = WebMock::RequestRegistry.instance.requested_signatures.hash.first

    assert_requested(:any, "http://localhost/redirected", times: CheckoutIntents::Client::MAX_REDIRECTS) do
      assert_equal(recorded.method, _1.method)
      assert_equal(recorded.body, _1.body)
      assert_equal(
        recorded.headers.transform_keys(&:downcase).fetch("content-type"),
        _1.headers.transform_keys(&:downcase).fetch("content-type")
      )
    end
  end

  def test_client_redirect_303
    stub_request(:post, "http://localhost/api/v1/checkout-intents").to_return_json(
      status: 303,
      headers: {"location" => "/redirected"},
      body: {}
    )
    stub_request(:get, "http://localhost/redirected").to_return(
      status: 303,
      headers: {"location" => "/redirected"}
    )

    checkout_intents = CheckoutIntents::Client.new(base_url: "http://localhost", api_key: "My API Key")

    assert_raises(CheckoutIntents::Errors::APIConnectionError) do
      checkout_intents.checkout_intents.create(
        buyer: {
          address1: "123 Main St",
          city: "New York",
          country: "US",
          email: "john.doe@example.com",
          firstName: "John",
          lastName: "Doe",
          phone: "1234567890",
          postalCode: "10001",
          province: "NY"
        },
        product_url: "productUrl",
        quantity: 1,
        request_options: {extra_headers: {}}
      )
    end

    assert_requested(:get, "http://localhost/redirected", times: CheckoutIntents::Client::MAX_REDIRECTS) do
      headers = _1.headers.keys.map(&:downcase)
      refute_includes(headers, "content-type")
      assert_nil(_1.body)
    end
  end

  def test_client_redirect_auth_keep_same_origin
    stub_request(:post, "http://localhost/api/v1/checkout-intents").to_return_json(
      status: 307,
      headers: {"location" => "/redirected"},
      body: {}
    )
    stub_request(:any, "http://localhost/redirected").to_return(
      status: 307,
      headers: {"location" => "/redirected"}
    )

    checkout_intents = CheckoutIntents::Client.new(base_url: "http://localhost", api_key: "My API Key")

    assert_raises(CheckoutIntents::Errors::APIConnectionError) do
      checkout_intents.checkout_intents.create(
        buyer: {
          address1: "123 Main St",
          city: "New York",
          country: "US",
          email: "john.doe@example.com",
          firstName: "John",
          lastName: "Doe",
          phone: "1234567890",
          postalCode: "10001",
          province: "NY"
        },
        product_url: "productUrl",
        quantity: 1,
        request_options: {extra_headers: {"authorization" => "Bearer xyz"}}
      )
    end

    recorded, = WebMock::RequestRegistry.instance.requested_signatures.hash.first
    auth_header = recorded.headers.transform_keys(&:downcase).fetch("authorization")

    assert_equal("Bearer xyz", auth_header)
    assert_requested(:any, "http://localhost/redirected", times: CheckoutIntents::Client::MAX_REDIRECTS) do
      auth_header = _1.headers.transform_keys(&:downcase).fetch("authorization")
      assert_equal("Bearer xyz", auth_header)
    end
  end

  def test_client_redirect_auth_strip_cross_origin
    stub_request(:post, "http://localhost/api/v1/checkout-intents").to_return_json(
      status: 307,
      headers: {"location" => "https://example.com/redirected"},
      body: {}
    )
    stub_request(:any, "https://example.com/redirected").to_return(
      status: 307,
      headers: {"location" => "https://example.com/redirected"}
    )

    checkout_intents = CheckoutIntents::Client.new(base_url: "http://localhost", api_key: "My API Key")

    assert_raises(CheckoutIntents::Errors::APIConnectionError) do
      checkout_intents.checkout_intents.create(
        buyer: {
          address1: "123 Main St",
          city: "New York",
          country: "US",
          email: "john.doe@example.com",
          firstName: "John",
          lastName: "Doe",
          phone: "1234567890",
          postalCode: "10001",
          province: "NY"
        },
        product_url: "productUrl",
        quantity: 1,
        request_options: {extra_headers: {"authorization" => "Bearer xyz"}}
      )
    end

    assert_requested(:any, "https://example.com/redirected", times: CheckoutIntents::Client::MAX_REDIRECTS) do
      headers = _1.headers.keys.map(&:downcase)
      refute_includes(headers, "authorization")
    end
  end

  def test_default_headers
    stub_request(:post, "http://localhost/api/v1/checkout-intents").to_return_json(status: 200, body: {})

    checkout_intents = CheckoutIntents::Client.new(base_url: "http://localhost", api_key: "My API Key")

    checkout_intents.checkout_intents.create(
      buyer: {
        address1: "123 Main St",
        city: "New York",
        country: "US",
        email: "john.doe@example.com",
        firstName: "John",
        lastName: "Doe",
        phone: "1234567890",
        postalCode: "10001",
        province: "NY"
      },
      product_url: "productUrl",
      quantity: 1
    )

    assert_requested(:any, /./) do |req|
      headers = req.headers.transform_keys(&:downcase).fetch_values("accept", "content-type")
      headers.each { refute_empty(_1) }
    end
  end

  # Environment auto-inference tests

  def test_auto_infers_staging_from_api_key
    client = CheckoutIntents::Client.new(api_key: "RYE/staging-abc123def456")
    assert_equal("https://staging.api.rye.com/", client.base_url.to_s)
  end

  def test_auto_infers_production_from_api_key
    client = CheckoutIntents::Client.new(api_key: "RYE/production-xyz789ghi012")
    assert_equal("https://api.rye.com/", client.base_url.to_s)
  end

  def test_explicit_environment_matches_staging_api_key
    client = CheckoutIntents::Client.new(
      api_key: "RYE/staging-abc123def456",
      environment: :staging
    )
    assert_equal("https://staging.api.rye.com/", client.base_url.to_s)
  end

  def test_explicit_environment_matches_production_api_key
    client = CheckoutIntents::Client.new(
      api_key: "RYE/production-xyz789ghi012",
      environment: :production
    )
    assert_equal("https://api.rye.com/", client.base_url.to_s)
  end

  def test_raises_on_environment_mismatch_staging_key_production_env
    e = assert_raises(ArgumentError) do
      CheckoutIntents::Client.new(
        api_key: "RYE/staging-abc123def456",
        environment: :production
      )
    end

    assert_match(/Environment mismatch/, e.message)
    assert_match(/API key is for 'staging' environment/, e.message)
    assert_match(/'environment' option is set to 'production'/, e.message)
  end

  def test_raises_on_environment_mismatch_production_key_staging_env
    e = assert_raises(ArgumentError) do
      CheckoutIntents::Client.new(
        api_key: "RYE/production-xyz789ghi012",
        environment: :staging
      )
    end

    assert_match(/Environment mismatch/, e.message)
    assert_match(/API key is for 'production' environment/, e.message)
    assert_match(/'environment' option is set to 'staging'/, e.message)
  end

  def test_defaults_to_staging_for_malformed_api_key
    client = CheckoutIntents::Client.new(api_key: "malformed-api-key")
    assert_equal("https://staging.api.rye.com/", client.base_url.to_s)
  end

  def test_explicit_environment_with_malformed_api_key
    client = CheckoutIntents::Client.new(
      api_key: "malformed-api-key",
      environment: :production
    )
    assert_equal("https://api.rye.com/", client.base_url.to_s)
  end

  def test_base_url_overrides_inferred_environment
    client = CheckoutIntents::Client.new(
      api_key: "RYE/staging-abc123def456",
      base_url: "https://custom.api.example.com/"
    )
    assert_equal("https://custom.api.example.com/", client.base_url.to_s)
  end

  def test_empty_api_key_prefix_does_not_match
    client = CheckoutIntents::Client.new(api_key: "RYE/-abc123")
    # Falls back to default staging
    assert_equal("https://staging.api.rye.com/", client.base_url.to_s)
  end

  def test_uppercase_environment_does_not_match
    client = CheckoutIntents::Client.new(api_key: "RYE/STAGING-abc123")
    # Falls back to default staging
    assert_equal("https://staging.api.rye.com/", client.base_url.to_s)
  end

  def test_partial_match_does_not_work
    client = CheckoutIntents::Client.new(api_key: "RYE/production")
    # Falls back to default staging (no hyphen after environment)
    assert_equal("https://staging.api.rye.com/", client.base_url.to_s)
  end

  def test_string_environment_option_works_with_matching_api_key
    client = CheckoutIntents::Client.new(
      api_key: "RYE/staging-abc123def456",
      environment: "staging"
    )
    assert_equal("https://staging.api.rye.com/", client.base_url.to_s)
  end

  # Polling helper tests

  def test_poll_until_completed_returns_on_completed
    call_count = 0

    stub_request(:get, "http://localhost/api/v1/checkout-intents/ci_123").to_return do
      call_count += 1
      state = call_count == 1 ? "placing_order" : "completed"
      {
        status: 200,
        headers: {"Content-Type" => "application/json"},
        body: {
          id: "ci_123",
          state: state,
          buyer: mock_buyer,
          createdAt: "2024-01-01T00:00:00Z",
          productUrl: "https://example.com/product",
          quantity: 1,
          offer: mock_offer,
          paymentMethod: {type: "stripe_token", stripeToken: "tok_test"}
        }.to_json
      }
    end

    client = CheckoutIntents::Client.new(base_url: "http://localhost", api_key: "My API Key")
    result = client.checkout_intents.poll_until_completed("ci_123", poll_interval: 0.01, max_attempts: 10)

    assert_equal(:completed, result.state)
    assert_equal(2, call_count)
  end

  def test_poll_until_completed_returns_on_failed
    stub_request(:get, "http://localhost/api/v1/checkout-intents/ci_123").to_return_json(
      status: 200,
      body: {
        id: "ci_123",
        state: "failed",
        failureReason: {code: "payment_failed", message: "Payment failed"},
        buyer: mock_buyer,
        createdAt: "2024-01-01T00:00:00Z",
        productUrl: "https://example.com/product",
        quantity: 1
      }
    )

    client = CheckoutIntents::Client.new(base_url: "http://localhost", api_key: "My API Key")
    result = client.checkout_intents.poll_until_completed("ci_123", poll_interval: 0.01)

    assert_equal(:failed, result.state)
    assert_equal(:payment_failed, result.failure_reason.code)
  end

  def test_poll_until_completed_timeout
    stub_request(:get, "http://localhost/api/v1/checkout-intents/ci_123").to_return_json(
      status: 200,
      body: {
        id: "ci_123",
        state: "placing_order",
        buyer: mock_buyer,
        createdAt: "2024-01-01T00:00:00Z",
        productUrl: "https://example.com/product",
        quantity: 1,
        offer: mock_offer,
        paymentMethod: {type: "stripe_token", stripeToken: "tok_test"}
      }
    )

    client = CheckoutIntents::Client.new(base_url: "http://localhost", api_key: "My API Key")

    error = assert_raises(CheckoutIntents::Errors::PollTimeoutError) do
      client.checkout_intents.poll_until_completed("ci_123", poll_interval: 0.01, max_attempts: 2)
    end

    assert_equal("ci_123", error.intent_id)
    assert_equal(2, error.attempts)
    assert_equal(0.01, error.poll_interval)
    assert_equal(2, error.max_attempts)
    assert_match(/Polling timeout/, error.message)
    assert_match(/ci_123/, error.message)
  end

  def test_poll_until_awaiting_confirmation
    stub_request(:get, "http://localhost/api/v1/checkout-intents/ci_123").to_return_json(
      status: 200,
      body: {
        id: "ci_123",
        state: "awaiting_confirmation",
        buyer: mock_buyer,
        createdAt: "2024-01-01T00:00:00Z",
        productUrl: "https://example.com/product",
        quantity: 1,
        offer: mock_offer
      }
    )

    client = CheckoutIntents::Client.new(base_url: "http://localhost", api_key: "My API Key")
    result = client.checkout_intents.poll_until_awaiting_confirmation("ci_123", poll_interval: 0.01)

    assert_equal(:awaiting_confirmation, result.state)
  end

  def test_poll_until_awaiting_confirmation_returns_on_failed
    stub_request(:get, "http://localhost/api/v1/checkout-intents/ci_123").to_return_json(
      status: 200,
      body: {
        id: "ci_123",
        state: "failed",
        failureReason: {code: "offer_retrieval_failed", message: "Could not retrieve offer"},
        buyer: mock_buyer,
        createdAt: "2024-01-01T00:00:00Z",
        productUrl: "https://example.com/product",
        quantity: 1
      }
    )

    client = CheckoutIntents::Client.new(base_url: "http://localhost", api_key: "My API Key")
    result = client.checkout_intents.poll_until_awaiting_confirmation("ci_123", poll_interval: 0.01)

    assert_equal(:failed, result.state)
    assert_equal(:offer_retrieval_failed, result.failure_reason.code)
  end

  def test_create_and_poll
    stub_request(:post, "http://localhost/api/v1/checkout-intents").to_return_json(
      status: 200,
      body: {
        id: "ci_123",
        state: "retrieving_offer",
        buyer: mock_buyer,
        createdAt: "2024-01-01T00:00:00Z",
        productUrl: "https://example.com/product",
        quantity: 1
      }
    )

    stub_request(:get, "http://localhost/api/v1/checkout-intents/ci_123").to_return_json(
      status: 200,
      body: {
        id: "ci_123",
        state: "awaiting_confirmation",
        buyer: mock_buyer,
        createdAt: "2024-01-01T00:00:00Z",
        productUrl: "https://example.com/product",
        quantity: 1,
        offer: mock_offer
      }
    )

    client = CheckoutIntents::Client.new(base_url: "http://localhost", api_key: "My API Key")
    result = client.checkout_intents.create_and_poll(
      buyer: {
        address1: "123 Main St",
        city: "New York",
        country: "US",
        email: "test@example.com",
        firstName: "John",
        lastName: "Doe",
        phone: "5555555555",
        postalCode: "10001",
        province: "NY"
      },
      product_url: "https://example.com/product",
      quantity: 1,
      poll_interval: 0.01
    )

    assert_equal(:awaiting_confirmation, result.state)
    assert_requested(:post, "http://localhost/api/v1/checkout-intents", times: 1)
    assert_requested(:get, "http://localhost/api/v1/checkout-intents/ci_123", times: 1)
  end

  def test_confirm_and_poll
    stub_request(:post, "http://localhost/api/v1/checkout-intents/ci_123/confirm").to_return_json(
      status: 200,
      body: {
        id: "ci_123",
        state: "placing_order",
        buyer: mock_buyer,
        createdAt: "2024-01-01T00:00:00Z",
        productUrl: "https://example.com/product",
        quantity: 1,
        offer: mock_offer,
        paymentMethod: {type: "stripe_token", stripeToken: "tok_test"}
      }
    )

    stub_request(:get, "http://localhost/api/v1/checkout-intents/ci_123").to_return_json(
      status: 200,
      body: {
        id: "ci_123",
        state: "completed",
        buyer: mock_buyer,
        createdAt: "2024-01-01T00:00:00Z",
        productUrl: "https://example.com/product",
        quantity: 1,
        offer: mock_offer,
        paymentMethod: {type: "stripe_token", stripeToken: "tok_test"}
      }
    )

    client = CheckoutIntents::Client.new(base_url: "http://localhost", api_key: "My API Key")
    result = client.checkout_intents.confirm_and_poll(
      "ci_123",
      payment_method: {type: :stripe_token, stripeToken: "tok_test"},
      poll_interval: 0.01
    )

    assert_equal(:completed, result.state)
    assert_requested(:post, "http://localhost/api/v1/checkout-intents/ci_123/confirm", times: 1)
    assert_requested(:get, "http://localhost/api/v1/checkout-intents/ci_123", times: 1)
  end

  def test_poll_respects_retry_after_ms_header
    call_count = 0

    stub_request(:get, "http://localhost/api/v1/checkout-intents/ci_123").to_return do
      call_count += 1
      state = call_count == 1 ? "placing_order" : "completed"
      {
        status: 200,
        headers: {
          "Content-Type" => "application/json",
          "retry-after-ms" => "1000"
        },
        body: {
          id: "ci_123",
          state: state,
          buyer: mock_buyer,
          createdAt: "2024-01-01T00:00:00Z",
          productUrl: "https://example.com/product",
          quantity: 1,
          offer: mock_offer,
          paymentMethod: {type: "stripe_token", stripeToken: "tok_test"}
        }.to_json
      }
    end

    client = CheckoutIntents::Client.new(base_url: "http://localhost", api_key: "My API Key")
    result = client.checkout_intents.poll_until_completed("ci_123", poll_interval: 0.1, max_attempts: 10)

    assert_equal(:completed, result.state)
    # Should have used the server-suggested interval (1 second = 1.0)
    sleep_times = Thread.current.thread_variable_get(:mock_sleep)
    assert_equal(1, sleep_times.length)
    assert_equal(1.0, sleep_times.first)
  end

  def test_poll_sends_stainless_headers
    stub_request(:get, "http://localhost/api/v1/checkout-intents/ci_123").to_return_json(
      status: 200,
      body: {
        id: "ci_123",
        state: "completed",
        buyer: mock_buyer,
        createdAt: "2024-01-01T00:00:00Z",
        productUrl: "https://example.com/product",
        quantity: 1,
        offer: mock_offer,
        paymentMethod: {type: "stripe_token", stripeToken: "tok_test"}
      }
    )

    client = CheckoutIntents::Client.new(base_url: "http://localhost", api_key: "My API Key")
    client.checkout_intents.poll_until_completed("ci_123", poll_interval: 5.0)

    assert_requested(:get, "http://localhost/api/v1/checkout-intents/ci_123") do |req|
      headers = req.headers.transform_keys(&:downcase)
      assert_equal("true", headers["x-stainless-poll-helper"])
      assert_equal("5000", headers["x-stainless-custom-poll-interval"])
    end
  end

  def test_poll_coerces_invalid_max_attempts
    stub_request(:get, "http://localhost/api/v1/checkout-intents/ci_123").to_return_json(
      status: 200,
      body: {
        id: "ci_123",
        state: "completed",
        buyer: mock_buyer,
        createdAt: "2024-01-01T00:00:00Z",
        productUrl: "https://example.com/product",
        quantity: 1,
        offer: mock_offer,
        paymentMethod: {type: "stripe_token", stripeToken: "tok_test"}
      }
    )

    client = CheckoutIntents::Client.new(base_url: "http://localhost", api_key: "My API Key")

    # Capture stderr to check for warning
    original_stderr = $stderr
    $stderr = StringIO.new

    result = client.checkout_intents.poll_until_completed("ci_123", poll_interval: 0.01, max_attempts: 0)

    warning_output = $stderr.string
    $stderr = original_stderr

    assert_equal(:completed, result.state)
    assert_match(/Invalid max_attempts value: 0/, warning_output)
    assert_requested(:get, "http://localhost/api/v1/checkout-intents/ci_123", times: 1)
  end

  private

  def mock_buyer
    {
      address1: "123 Main St",
      city: "New York",
      country: "US",
      email: "test@example.com",
      firstName: "John",
      lastName: "Doe",
      phone: "5555555555",
      postalCode: "10001",
      province: "NY"
    }
  end

  def mock_offer
    {
      cost: {
        subtotal: {amountSubunits: 1000, currencyCode: "USD"},
        total: {amountSubunits: 1100, currencyCode: "USD"}
      },
      shipping: {availableOptions: []}
    }
  end
end
