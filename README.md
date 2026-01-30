# Checkout Intents Ruby API library

The Checkout Intents Ruby library provides convenient access to the Checkout Intents REST API from any Ruby 3.2.0+ application. It ships with comprehensive types & docstrings in Yard, RBS, and RBI – [see below](https://github.com/rye-com/checkout-intents-ruby#Sorbet) for usage with Sorbet. The standard library's `net/http` is used as the HTTP transport, with connection pooling via the `connection_pool` gem.

It is generated with [Stainless](https://www.stainless.com/).

## Documentation

Documentation for releases of this gem can be found [on RubyDoc](https://gemdocs.org/gems/checkout-intents).

The REST API documentation can be found on [docs.rye.com](https://docs.rye.com).

## Installation

To use this gem, install via Bundler by adding the following to your application's `Gemfile`:

<!-- x-release-please-start-version -->

```ruby
gem "checkout-intents", "~> 0.3.0"
```

<!-- x-release-please-end -->

## Usage

```ruby
require "bundler/setup"
require "checkout_intents"

checkout_intents = CheckoutIntents::Client.new(
  api_key: ENV["CHECKOUT_INTENTS_API_KEY"], # This is the default and can be omitted
  environment: "production" # defaults to "staging"
)

checkout_intent = checkout_intents.checkout_intents.purchase(
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
  payment_method: {stripeToken: "tok_1RkrWWHGDlstla3f1Fc7ZrhH", type: "stripe_token"},
  product_url: "https://rye-protocol.myshopify.com/products/rye-sticker",
  quantity: 1
)

puts(checkout_intent)
```

### Pagination

List methods in the Checkout Intents API are paginated.

This library provides auto-paginating iterators with each list response, so you do not have to request successive pages manually:

```ruby
page = checkout_intents.checkout_intents.list(limit: 20)

# Fetch single item from page.
checkout_intent = page.data[0]
puts(checkout_intent)

# Automatically fetches more pages as needed.
page.auto_paging_each do |checkout_intent|
  puts(checkout_intent)
end
```

Alternatively, you can use the `#next_page?` and `#next_page` methods for more granular control working with pages.

```ruby
if page.next_page?
  new_page = page.next_page
  puts(new_page.data[0])
end
```

### Handling errors

When the library is unable to connect to the API, or if the API returns a non-success status code (i.e., 4xx or 5xx response), a subclass of `CheckoutIntents::Errors::APIError` will be thrown:

```ruby
begin
  checkout_intent = checkout_intents.checkout_intents.create(
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
    product_url: "https://rye-protocol.myshopify.com/products/rye-sticker",
    quantity: 1
  )
rescue CheckoutIntents::Errors::APIConnectionError => e
  puts("The server could not be reached")
  puts(e.cause)  # an underlying Exception, likely raised within `net/http`
rescue CheckoutIntents::Errors::RateLimitError => e
  puts("A 429 status code was received; we should back off a bit.")
rescue CheckoutIntents::Errors::APIStatusError => e
  puts("Another non-200-range status code was received")
  puts(e.status)
end
```

Error codes are as follows:

| Cause            | Error Type                 |
| ---------------- | -------------------------- |
| HTTP 400         | `BadRequestError`          |
| HTTP 401         | `AuthenticationError`      |
| HTTP 403         | `PermissionDeniedError`    |
| HTTP 404         | `NotFoundError`            |
| HTTP 409         | `ConflictError`            |
| HTTP 422         | `UnprocessableEntityError` |
| HTTP 429         | `RateLimitError`           |
| HTTP >= 500      | `InternalServerError`      |
| Other HTTP error | `APIStatusError`           |
| Timeout          | `APITimeoutError`          |
| Network error    | `APIConnectionError`       |

### Retries

Certain errors will be automatically retried 2 times by default, with a short exponential backoff.

Connection errors (for example, due to a network connectivity problem), 408 Request Timeout, 409 Conflict, 429 Rate Limit, >=500 Internal errors, and timeouts will all be retried by default.

You can use the `max_retries` option to configure or disable this:

```ruby
# Configure the default for all requests:
checkout_intents = CheckoutIntents::Client.new(
  max_retries: 0 # default is 2
)

# Or, configure per-request:
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
  product_url: "https://rye-protocol.myshopify.com/products/rye-sticker",
  quantity: 1,
  request_options: {max_retries: 5}
)
```

### Timeouts

By default, requests will time out after 60 seconds. You can use the timeout option to configure or disable this:

```ruby
# Configure the default for all requests:
checkout_intents = CheckoutIntents::Client.new(
  timeout: nil # default is 60
)

# Or, configure per-request:
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
  product_url: "https://rye-protocol.myshopify.com/products/rye-sticker",
  quantity: 1,
  request_options: {timeout: 5}
)
```

On timeout, `CheckoutIntents::Errors::APITimeoutError` is raised.

Note that requests that time out are retried by default.

## Advanced concepts

### BaseModel

All parameter and response objects inherit from `CheckoutIntents::Internal::Type::BaseModel`, which provides several conveniences, including:

1. All fields, including unknown ones, are accessible with `obj[:prop]` syntax, and can be destructured with `obj => {prop: prop}` or pattern-matching syntax.

2. Structural equivalence for equality; if two API calls return the same values, comparing the responses with == will return true.

3. Both instances and the classes themselves can be pretty-printed.

4. Helpers such as `#to_h`, `#deep_to_h`, `#to_json`, and `#to_yaml`.

### Making custom or undocumented requests

#### Undocumented properties

You can send undocumented parameters to any endpoint, and read undocumented response properties, like so:

Note: the `extra_` parameters of the same name overrides the documented parameters.

```ruby
checkout_intent =
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
    product_url: "https://rye-protocol.myshopify.com/products/rye-sticker",
    quantity: 1,
    request_options: {
      extra_query: {my_query_parameter: value},
      extra_body: {my_body_parameter: value},
      extra_headers: {"my-header": value}
    }
  )

puts(checkout_intent[:my_undocumented_property])
```

#### Undocumented request params

If you want to explicitly send an extra param, you can do so with the `extra_query`, `extra_body`, and `extra_headers` under the `request_options:` parameter when making a request, as seen in the examples above.

#### Undocumented endpoints

To make requests to undocumented endpoints while retaining the benefit of auth, retries, and so on, you can make requests using `client.request`, like so:

```ruby
response = client.request(
  method: :post,
  path: '/undocumented/endpoint',
  query: {"dog": "woof"},
  headers: {"useful-header": "interesting-value"},
  body: {"hello": "world"}
)
```

### Concurrency & connection pooling

The `CheckoutIntents::Client` instances are threadsafe, but are only are fork-safe when there are no in-flight HTTP requests.

Each instance of `CheckoutIntents::Client` has its own HTTP connection pool with a default size of 99. As such, we recommend instantiating the client once per application in most settings.

When all available connections from the pool are checked out, requests wait for a new connection to become available, with queue time counting towards the request timeout.

Unless otherwise specified, other classes in the SDK do not have locks protecting their underlying data structure.

## Sorbet

This library provides comprehensive [RBI](https://sorbet.org/docs/rbi) definitions, and has no dependency on sorbet-runtime.

You can provide typesafe request parameters like so:

```ruby
checkout_intents.checkout_intents.purchase(
  buyer: CheckoutIntents::Buyer.new(
    address1: "123 Main St",
    city: "New York",
    country: "US",
    email: "john.doe@example.com",
    first_name: "John",
    last_name: "Doe",
    phone: "1234567890",
    postal_code: "10001",
    province: "NY"
  ),
  payment_method: CheckoutIntents::PaymentMethod::StripeTokenPaymentMethod.new(
    stripe_token: "tok_1RkrWWHGDlstla3f1Fc7ZrhH",
    type: "stripe_token"
  ),
  product_url: "https://rye-protocol.myshopify.com/products/rye-sticker",
  quantity: 1
)
```

Or, equivalently:

```ruby
# Hashes work, but are not typesafe:
checkout_intents.checkout_intents.purchase(
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
  payment_method: {stripeToken: "tok_1RkrWWHGDlstla3f1Fc7ZrhH", type: "stripe_token"},
  product_url: "https://rye-protocol.myshopify.com/products/rye-sticker",
  quantity: 1
)

# You can also splat a full Params class:
params = CheckoutIntents::CheckoutIntentPurchaseParams.new(
  buyer: CheckoutIntents::Buyer.new(
    address1: "123 Main St",
    city: "New York",
    country: "US",
    email: "john.doe@example.com",
    first_name: "John",
    last_name: "Doe",
    phone: "1234567890",
    postal_code: "10001",
    province: "NY"
  ),
  payment_method: CheckoutIntents::PaymentMethod::StripeTokenPaymentMethod.new(
    stripe_token: "tok_1RkrWWHGDlstla3f1Fc7ZrhH",
    type: "stripe_token"
  ),
  product_url: "https://rye-protocol.myshopify.com/products/rye-sticker",
  quantity: 1
)
checkout_intents.checkout_intents.purchase(**params)
```

### Enums

Since this library does not depend on `sorbet-runtime`, it cannot provide [`T::Enum`](https://sorbet.org/docs/tenum) instances. Instead, we provide "tagged symbols" instead, which is always a primitive at runtime:

```ruby
# :in_stock
puts(CheckoutIntents::ProductAvailability::IN_STOCK)

# Revealed type: `T.all(CheckoutIntents::ProductAvailability, Symbol)`
T.reveal_type(CheckoutIntents::ProductAvailability::IN_STOCK)
```

Enum parameters have a "relaxed" type, so you can either pass in enum constants or their literal value:

```ruby
CheckoutIntents::Product.new(
  availability: CheckoutIntents::ProductAvailability::IN_STOCK,
  # …
)

CheckoutIntents::Product.new(
  availability: :in_stock,
  # …
)
```

## Versioning

This package follows [SemVer](https://semver.org/spec/v2.0.0.html) conventions. As the library is in initial development and has a major version of `0`, APIs may change at any time.

This package considers improvements to the (non-runtime) `*.rbi` and `*.rbs` type definitions to be non-breaking changes.

## Requirements

Ruby 3.2.0 or higher.

## Contributing

See [the contributing documentation](https://github.com/rye-com/checkout-intents-ruby/tree/main/CONTRIBUTING.md).
