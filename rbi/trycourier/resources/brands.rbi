# typed: strong

module Trycourier
  module Resources
    class Brands
      # Create a new brand
      sig do
        params(
          name: String,
          id: T.nilable(String),
          settings: T.nilable(Trycourier::BrandSettings::OrHash),
          snippets: T.nilable(Trycourier::BrandSnippets::OrHash),
          request_options: Trycourier::RequestOptions::OrHash
        ).returns(Trycourier::Brand)
      end
      def create(
        name:,
        id: nil,
        settings: nil,
        snippets: nil,
        request_options: {}
      )
      end

      # Fetch a specific brand by brand ID.
      sig do
        params(
          brand_id: String,
          request_options: Trycourier::RequestOptions::OrHash
        ).returns(Trycourier::Brand)
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
          settings: T.nilable(Trycourier::BrandSettings::OrHash),
          snippets: T.nilable(Trycourier::BrandSnippets::OrHash),
          request_options: Trycourier::RequestOptions::OrHash
        ).returns(Trycourier::Brand)
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
          request_options: Trycourier::RequestOptions::OrHash
        ).returns(Trycourier::Models::BrandListResponse)
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
          request_options: Trycourier::RequestOptions::OrHash
        ).void
      end
      def delete(
        # A unique identifier associated with the brand you wish to retrieve.
        brand_id,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Trycourier::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
