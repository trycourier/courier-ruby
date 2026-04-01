# frozen_string_literal: true

module Courier
  module Models
    module Providers
      # @see Courier::Resources::Providers::Catalog#list
      class CatalogListParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        # @!attribute channel
        #   Exact match (case-insensitive) against the provider channel taxonomy (e.g.
        #   `email`, `sms`, `push`).
        #
        #   @return [String, nil]
        optional :channel, String

        # @!attribute keys
        #   Comma-separated provider keys to filter by (e.g. `sendgrid,twilio`).
        #
        #   @return [String, nil]
        optional :keys, String

        # @!attribute name
        #   Case-insensitive substring match against the provider display name.
        #
        #   @return [String, nil]
        optional :name, String

        # @!method initialize(channel: nil, keys: nil, name: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Courier::Models::Providers::CatalogListParams} for more details.
        #
        #   @param channel [String] Exact match (case-insensitive) against the provider channel taxonomy (e.g. `emai
        #
        #   @param keys [String] Comma-separated provider keys to filter by (e.g. `sendgrid,twilio`).
        #
        #   @param name [String] Case-insensitive substring match against the provider display name.
        #
        #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
