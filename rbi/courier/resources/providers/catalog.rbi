# typed: strong

module Courier
  module Resources
    class Providers
      # Configure the channel providers Courier delivers through, and browse the
      # provider types it supports.
      class Catalog
        # Returns the provider types Courier supports, each with a display name,
        # description, and the configuration fields it requires.
        sig do
          params(
            channel: String,
            keys: String,
            name: String,
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::Models::Providers::CatalogListResponse)
        end
        def list(
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

        # @api private
        sig { params(client: Courier::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
