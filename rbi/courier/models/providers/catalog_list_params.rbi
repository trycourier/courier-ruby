# typed: strong

module Courier
  module Models
    module Providers
      class CatalogListParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Courier::Providers::CatalogListParams,
              Courier::Internal::AnyHash
            )
          end

        # Exact match (case-insensitive) against the provider channel taxonomy (e.g.
        # `email`, `sms`, `push`).
        sig { returns(T.nilable(String)) }
        attr_reader :channel

        sig { params(channel: String).void }
        attr_writer :channel

        # Comma-separated provider keys to filter by (e.g. `sendgrid,twilio`).
        sig { returns(T.nilable(String)) }
        attr_reader :keys

        sig { params(keys: String).void }
        attr_writer :keys

        # Case-insensitive substring match against the provider display name.
        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        sig do
          params(
            channel: String,
            keys: String,
            name: String,
            request_options: Courier::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Exact match (case-insensitive) against the provider channel taxonomy (e.g.
          # `email`, `sms`, `push`).
          channel: nil,
          # Comma-separated provider keys to filter by (e.g. `sendgrid,twilio`).
          keys: nil,
          # Case-insensitive substring match against the provider display name.
          name: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              channel: String,
              keys: String,
              name: String,
              request_options: Courier::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
