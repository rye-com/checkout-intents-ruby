# frozen_string_literal: true

# Standard libraries.
# rubocop:disable Lint/RedundantRequireStatement
require "English"
require "base64"
require "cgi"
require "date"
require "erb"
require "etc"
require "json"
require "net/http"
require "openssl"
require "pathname"
require "rbconfig"
require "securerandom"
require "set"
require "stringio"
require "time"
require "uri"
# rubocop:enable Lint/RedundantRequireStatement

# We already ship the preferred sorbet manifests in the package itself.
# `tapioca` currently does not offer us a way to opt out of unnecessary compilation.
if Object.const_defined?(:Tapioca) &&
   caller.chain([$PROGRAM_NAME]).chain(ARGV).any?(/tapioca/) &&
   ARGV.none?(/dsl/)
  return
end

# Gems.
require "connection_pool"

# Package files.
require_relative "checkout_intents/version"
require_relative "checkout_intents/internal/util"
require_relative "checkout_intents/internal/type/converter"
require_relative "checkout_intents/internal/type/unknown"
require_relative "checkout_intents/internal/type/boolean"
require_relative "checkout_intents/internal/type/file_input"
require_relative "checkout_intents/internal/type/enum"
require_relative "checkout_intents/internal/type/union"
require_relative "checkout_intents/internal/type/array_of"
require_relative "checkout_intents/internal/type/hash_of"
require_relative "checkout_intents/internal/type/base_model"
require_relative "checkout_intents/internal/type/base_page"
require_relative "checkout_intents/internal/type/request_parameters"
require_relative "checkout_intents/internal"
require_relative "checkout_intents/request_options"
require_relative "checkout_intents/file_part"
require_relative "checkout_intents/errors"
require_relative "checkout_intents/internal/transport/base_client"
require_relative "checkout_intents/internal/transport/pooled_net_requester"
require_relative "checkout_intents/client"
require_relative "checkout_intents/internal/cursorPagination"
require_relative "checkout_intents/models/base_checkout_intent"
require_relative "checkout_intents/models/betas/checkout_session_create_params"
require_relative "checkout_intents/models/billing_get_balance_params"
require_relative "checkout_intents/models/billing_get_balance_response"
require_relative "checkout_intents/models/billing_list_transactions_params"
require_relative "checkout_intents/models/billing_list_transactions_response"
require_relative "checkout_intents/models/brand_retrieve_params"
require_relative "checkout_intents/models/brand_retrieve_response"
require_relative "checkout_intents/models/buyer"
require_relative "checkout_intents/models/checkout_intent"
require_relative "checkout_intents/models/checkout_intent_add_payment_params"
require_relative "checkout_intents/models/checkout_intent_confirm_params"
require_relative "checkout_intents/models/checkout_intent_create_params"
require_relative "checkout_intents/models/checkout_intent_list_params"
require_relative "checkout_intents/models/checkout_intent_purchase_params"
require_relative "checkout_intents/models/checkout_intent_retrieve_params"
require_relative "checkout_intents/models/checkout_session"
require_relative "checkout_intents/models/money"
require_relative "checkout_intents/models/offer"
require_relative "checkout_intents/models/payment_method"
require_relative "checkout_intents/models/product"
require_relative "checkout_intents/models/product_availability"
require_relative "checkout_intents/models/product_image"
require_relative "checkout_intents/models/product_lookup_params"
require_relative "checkout_intents/models/variant_selection"
require_relative "checkout_intents/models"
require_relative "checkout_intents/resources/betas"
require_relative "checkout_intents/resources/betas/checkout_sessions"
require_relative "checkout_intents/resources/billing"
require_relative "checkout_intents/resources/brands"
require_relative "checkout_intents/resources/checkout_intents"
require_relative "checkout_intents/resources/products"
