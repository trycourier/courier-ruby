# frozen_string_literal: true

module Courier
  module Models
    class ProvidersCatalogEntry < Courier::Internal::Type::BaseModel
      # @!attribute channel
      #   Courier taxonomy channel (e.g. email, push, sms, direct_message, inbox,
      #   webhook).
      #
      #   @return [String]
      required :channel, String

      # @!attribute description
      #   Short description of the provider.
      #
      #   @return [String]
      required :description, String

      # @!attribute name
      #   Human-readable display name.
      #
      #   @return [String]
      required :name, String

      # @!attribute provider
      #   The provider key (e.g. "sendgrid", "twilio").
      #
      #   @return [String]
      required :provider, String

      # @!attribute settings
      #   Map of setting field names (snake_case) to their schema descriptors. Each
      #   descriptor has `type` and `required`. Empty when the provider has no
      #   configurable schema.
      #
      #   @return [Hash{Symbol=>Courier::Models::ProvidersCatalogEntry::Setting}]
      required :settings, -> { Courier::Internal::Type::HashOf[Courier::ProvidersCatalogEntry::Setting] }

      # @!method initialize(channel:, description:, name:, provider:, settings:)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::ProvidersCatalogEntry} for more details.
      #
      #   A provider type from the catalog. Contains the key, display name, description,
      #   and a `settings` object describing configuration schema fields.
      #
      #   @param channel [String] Courier taxonomy channel (e.g. email, push, sms, direct_message, inbox, webhook)
      #
      #   @param description [String] Short description of the provider.
      #
      #   @param name [String] Human-readable display name.
      #
      #   @param provider [String] The provider key (e.g. "sendgrid", "twilio").
      #
      #   @param settings [Hash{Symbol=>Courier::Models::ProvidersCatalogEntry::Setting}] Map of setting field names (snake_case) to their schema descriptors. Each descri

      class Setting < Courier::Internal::Type::BaseModel
        # @!attribute required
        #   Whether this field is required when configuring the provider.
        #
        #   @return [Boolean]
        required :required, Courier::Internal::Type::Boolean

        # @!attribute type
        #   The field's data type (e.g. "string", "boolean", "enum").
        #
        #   @return [String]
        required :type, String

        # @!attribute values
        #   Allowed values when `type` is "enum".
        #
        #   @return [Array<String>, nil]
        optional :values, Courier::Internal::Type::ArrayOf[String]

        # @!method initialize(required:, type:, values: nil)
        #   Describes a single configuration field in the provider catalog.
        #
        #   @param required [Boolean] Whether this field is required when configuring the provider.
        #
        #   @param type [String] The field's data type (e.g. "string", "boolean", "enum").
        #
        #   @param values [Array<String>] Allowed values when `type` is "enum".
      end
    end
  end
end
