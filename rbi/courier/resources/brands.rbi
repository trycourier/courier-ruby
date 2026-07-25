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
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Brand)
      end
      def create(name:, settings:, id: nil, snippets: nil, request_options: {})
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
