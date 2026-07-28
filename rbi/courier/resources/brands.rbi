# typed: strong

module Courier
  module Resources
    class Brands
      # Creates a brand from a name and settings, including primary and secondary
      # colors. Brands supply the logo, colors, and styling that templates render with.
      sig do
        params(
          name: String,
          settings: Courier::BrandSettings::OrHash,
          id: T.nilable(String),
          snippets: T.nilable(Courier::BrandSnippets::OrHash),
          idempotency_key: String,
          x_idempotency_expiration: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Brand)
      end
      def create(
        # Body param
        name:,
        # Body param
        settings:,
        # Body param
        id: nil,
        # Body param
        snippets: nil,
        # Header param: A unique key that makes this request idempotent. If Courier
        # receives another request with the same `Idempotency-Key`, it returns the stored
        # response from the first request without performing the operation again
        # (including the original status code and any error). Use it to safely retry
        # `POST` requests after network failures without risking duplicate sends. The key
        # is scoped to this endpoint.
        idempotency_key: nil,
        # Header param: How long the idempotency key remains valid, as a Unix epoch
        # timestamp in seconds or an ISO 8601 date string. Only applies when
        # `Idempotency-Key` is provided. If omitted, the key is retained for 25 hours; the
        # maximum is 1 year.
        x_idempotency_expiration: nil,
        request_options: {}
      )
      end

      # Returns one brand by id, including its colors, logo and styling settings,
      # Handlebars snippets, and published version.
      sig do
        params(
          brand_id: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Brand)
      end
      def retrieve(
        # A unique identifier associated with the brand you wish to retrieve.
        brand_id,
        request_options: {}
      )
      end

      # Replaces a brand with the values you supply, so send the complete settings and
      # snippets rather than only the fields you want changed.
      sig do
        params(
          brand_id: String,
          name: String,
          settings: T.nilable(Courier::BrandSettings::OrHash),
          snippets: T.nilable(Courier::BrandSnippets::OrHash),
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Brand)
      end
      def update(
        # A unique identifier associated with the brand you wish to update.
        brand_id,
        # The name of the brand.
        name:,
        settings: nil,
        snippets: nil,
        request_options: {}
      )
      end

      # Lists the workspace's brands. Every entry carries its name, styling settings,
      # snippets, and published version.
      sig do
        params(
          cursor: T.nilable(String),
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Models::BrandListResponse)
      end
      def list(
        # A unique identifier that allows for fetching the next set of brands.
        cursor: nil,
        request_options: {}
      )
      end

      # Deletes a brand by id. Reassign any template or tenant that references it before
      # deleting to keep their styling intact.
      sig do
        params(
          brand_id: String,
          request_options: Courier::RequestOptions::OrHash
        ).void
      end
      def delete(
        # A unique identifier associated with the brand you wish to retrieve.
        brand_id,
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
