# typed: strong

module Courier
  module Models
    class ProvidersCatalogEntry < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::ProvidersCatalogEntry, Courier::Internal::AnyHash)
        end

      # Courier taxonomy channel (e.g. email, push, sms, direct_message, inbox,
      # webhook).
      sig { returns(String) }
      attr_accessor :channel

      # Short description of the provider.
      sig { returns(String) }
      attr_accessor :description

      # Human-readable display name.
      sig { returns(String) }
      attr_accessor :name

      # The provider key (e.g. "sendgrid", "twilio").
      sig { returns(String) }
      attr_accessor :provider

      # Map of setting field names (snake_case) to their schema descriptors. Each
      # descriptor has `type` and `required`. Empty when the provider has no
      # configurable schema.
      sig { returns(T::Hash[Symbol, Courier::ProvidersCatalogEntry::Setting]) }
      attr_accessor :settings

      # A provider type from the catalog. Contains the key, display name, description,
      # and a `settings` object describing configuration schema fields.
      sig do
        params(
          channel: String,
          description: String,
          name: String,
          provider: String,
          settings:
            T::Hash[Symbol, Courier::ProvidersCatalogEntry::Setting::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # Courier taxonomy channel (e.g. email, push, sms, direct_message, inbox,
        # webhook).
        channel:,
        # Short description of the provider.
        description:,
        # Human-readable display name.
        name:,
        # The provider key (e.g. "sendgrid", "twilio").
        provider:,
        # Map of setting field names (snake_case) to their schema descriptors. Each
        # descriptor has `type` and `required`. Empty when the provider has no
        # configurable schema.
        settings:
      )
      end

      sig do
        override.returns(
          {
            channel: String,
            description: String,
            name: String,
            provider: String,
            settings: T::Hash[Symbol, Courier::ProvidersCatalogEntry::Setting]
          }
        )
      end
      def to_hash
      end

      class Setting < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::ProvidersCatalogEntry::Setting,
              Courier::Internal::AnyHash
            )
          end

        # Whether this field is required when configuring the provider.
        sig { returns(T::Boolean) }
        attr_accessor :required

        # The field's data type (e.g. "string", "boolean", "enum").
        sig { returns(String) }
        attr_accessor :type

        # Allowed values when `type` is "enum".
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :values

        sig { params(values: T::Array[String]).void }
        attr_writer :values

        # Describes a single configuration field in the provider catalog.
        sig do
          params(
            required: T::Boolean,
            type: String,
            values: T::Array[String]
          ).returns(T.attached_class)
        end
        def self.new(
          # Whether this field is required when configuring the provider.
          required:,
          # The field's data type (e.g. "string", "boolean", "enum").
          type:,
          # Allowed values when `type` is "enum".
          values: nil
        )
        end

        sig do
          override.returns(
            { required: T::Boolean, type: String, values: T::Array[String] }
          )
        end
        def to_hash
        end
      end
    end
  end
end
