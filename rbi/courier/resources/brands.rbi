# typed: strong

module Courier
  module Resources
    class Brands
      # Create a new brand
      sig do
        params(
          name: String,
          settings: Courier::BrandSettings::OrHash,
          id: T.nilable(String),
          snippets: T.nilable(Courier::BrandSnippets::OrHash),
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Brand)
      end
      def create(
        # The name of the brand.
        name:,
        settings:,
        id: nil,
        snippets: nil,
        request_options: {}
      )
      end

      # Fetch a specific brand by brand ID.
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

      # Replace an existing brand with the supplied values.
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

      # Get the list of brands.
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

      # Delete a brand by brand ID.
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
