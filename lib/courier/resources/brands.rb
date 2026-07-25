# frozen_string_literal: true

module Courier
  module Resources
    class Brands
      # Creates a brand from a name and settings, including primary and secondary
      # colors. Brands supply the logo, colors, and styling that templates render with.
      #
      # @overload create(name:, settings:, id: nil, snippets: nil, request_options: {})
      #
      # @param name [String]
      # @param settings [Courier::Models::BrandSettings]
      # @param id [String, nil]
      # @param snippets [Courier::Models::BrandSnippets, nil]
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::Brand]
      #
      # @see Courier::Models::BrandCreateParams
      def create(params)
        parsed, options = Courier::BrandCreateParams.dump_request(params)
        @client.request(method: :post, path: "brands", body: parsed, model: Courier::Brand, options: options)
      end

      # Returns one brand by id, including its colors, logo and styling settings,
      # Handlebars snippets, and published version.
      #
      # @overload retrieve(brand_id, request_options: {})
      #
      # @param brand_id [String] A unique identifier associated with the brand you wish to retrieve.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::Brand]
      #
      # @see Courier::Models::BrandRetrieveParams
      def retrieve(brand_id, params = {})
        @client.request(
          method: :get,
          path: ["brands/%1$s", brand_id],
          model: Courier::Brand,
          options: params[:request_options]
        )
      end

      # Replaces a brand with the values you supply, so send the complete settings and
      # snippets rather than only the fields you want changed.
      #
      # @overload update(brand_id, name:, settings: nil, snippets: nil, request_options: {})
      #
      # @param brand_id [String] A unique identifier associated with the brand you wish to update.
      #
      # @param name [String] The name of the brand.
      #
      # @param settings [Courier::Models::BrandSettings, nil]
      #
      # @param snippets [Courier::Models::BrandSnippets, nil]
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::Brand]
      #
      # @see Courier::Models::BrandUpdateParams
      def update(brand_id, params)
        parsed, options = Courier::BrandUpdateParams.dump_request(params)
        @client.request(
          method: :put,
          path: ["brands/%1$s", brand_id],
          body: parsed,
          model: Courier::Brand,
          options: options
        )
      end

      # Lists the workspace's brands. Every entry carries its name, styling settings,
      # snippets, and published version.
      #
      # @overload list(cursor: nil, request_options: {})
      #
      # @param cursor [String, nil] A unique identifier that allows for fetching the next set of brands.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::BrandListResponse]
      #
      # @see Courier::Models::BrandListParams
      def list(params = {})
        parsed, options = Courier::BrandListParams.dump_request(params)
        query = Courier::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "brands",
          query: query,
          model: Courier::Models::BrandListResponse,
          options: options
        )
      end

      # Deletes a brand by id. Reassign any template or tenant that references it before
      # deleting to keep their styling intact.
      #
      # @overload delete(brand_id, request_options: {})
      #
      # @param brand_id [String] A unique identifier associated with the brand you wish to retrieve.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Courier::Models::BrandDeleteParams
      def delete(brand_id, params = {})
        @client.request(
          method: :delete,
          path: ["brands/%1$s", brand_id],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [Courier::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
