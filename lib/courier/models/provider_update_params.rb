# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Providers#update
    class ProviderUpdateParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute provider
      #   The provider key identifying the type. Required on every request because it
      #   selects the provider-specific settings schema for validation.
      #
      #   @return [String]
      required :provider, String

      # @!attribute alias_
      #   Updated alias. Omit to clear.
      #
      #   @return [String, nil]
      optional :alias_, String, api_name: :alias

      # @!attribute settings
      #   Provider-specific settings (snake_case keys). Replaces the full settings object
      #   — omitted settings fields are removed. Use the catalog endpoint to check
      #   required fields. Set `rate_limit` to cap this configuration's send rate:
      #   `{ "rate": <number greater than 0>, "period": "second" | "minute" | "hour" }`,
      #   e.g. `{ "rate": 0.5, "period": "minute" }` for one send every 2 minutes. The
      #   interval between sends (`period` divided by `rate`) must be from 1 millisecond
      #   to 12 hours, otherwise the request returns a 400 `InvalidRateLimit` error. The
      #   limit applies per configuration and per environment (a test-environment
      #   configuration has its own limit). Sends above the rate are queued, not dropped,
      #   and changes take up to 60 seconds to apply. It has no effect on observability or
      #   CDP integrations, which do not send messages. Omitting `rate_limit` or setting
      #   it to null removes any existing limit, including one set in Studio.
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :settings, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown]

      # @!attribute title
      #   Updated display title.
      #
      #   @return [String, nil]
      optional :title, String

      # @!method initialize(id:, provider:, alias_: nil, settings: nil, title: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::ProviderUpdateParams} for more details.
      #
      #   @param id [String]
      #
      #   @param provider [String] The provider key identifying the type. Required on every request because it sele
      #
      #   @param alias_ [String] Updated alias. Omit to clear.
      #
      #   @param settings [Hash{Symbol=>Object}] Provider-specific settings (snake_case keys). Replaces the full settings object
      #
      #   @param title [String] Updated display title.
      #
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
