# frozen_string_literal: true

module Trycourier
  module Resources
    class Brands
      # Create a new brand
      #
      # @overload create(name:, id: nil, settings: nil, snippets: nil, request_options: {})
      #
      # @param name [String]
      # @param id [String, nil]
      # @param settings [Trycourier::Models::BrandSettings, nil]
      # @param snippets [Trycourier::Models::BrandSnippets, nil]
      # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Trycourier::Models::Brand]
      #
      # @see Trycourier::Models::BrandCreateParams
      def create(params)
        parsed, options = Trycourier::BrandCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "brands",
          body: parsed,
          model: Trycourier::Brand,
          options: options
        )
      end

      # Fetch a specific brand by brand ID.
      #
      # @overload retrieve(brand_id, request_options: {})
      #
      # @param brand_id [String] A unique identifier associated with the brand you wish to retrieve.
      #
      # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Trycourier::Models::Brand]
      #
      # @see Trycourier::Models::BrandRetrieveParams
      def retrieve(brand_id, params = {})
        @client.request(
          method: :get,
          path: ["brands/%1$s", brand_id],
          model: Trycourier::Brand,
          options: params[:request_options]
        )
      end

      # Replace an existing brand with the supplied values.
      #
      # @overload update(brand_id, name:, settings: nil, snippets: nil, request_options: {})
      #
      # @param brand_id [String] A unique identifier associated with the brand you wish to update.
      #
      # @param name [String] The name of the brand.
      #
      # @param settings [Trycourier::Models::BrandSettings, nil]
      #
      # @param snippets [Trycourier::Models::BrandSnippets, nil]
      #
      # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Trycourier::Models::Brand]
      #
      # @see Trycourier::Models::BrandUpdateParams
      def update(brand_id, params)
        parsed, options = Trycourier::BrandUpdateParams.dump_request(params)
        @client.request(
          method: :put,
          path: ["brands/%1$s", brand_id],
          body: parsed,
          model: Trycourier::Brand,
          options: options
        )
      end

      # Get the list of brands.
      #
      # @overload list(cursor: nil, request_options: {})
      #
      # @param cursor [String, nil] A unique identifier that allows for fetching the next set of brands.
      #
      # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Trycourier::Models::BrandListResponse]
      #
      # @see Trycourier::Models::BrandListParams
      def list(params = {})
        parsed, options = Trycourier::BrandListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "brands",
          query: parsed,
          model: Trycourier::Models::BrandListResponse,
          options: options
        )
      end

      # Delete a brand by brand ID.
      #
      # @overload delete(brand_id, request_options: {})
      #
      # @param brand_id [String] A unique identifier associated with the brand you wish to retrieve.
      #
      # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Trycourier::Models::BrandDeleteParams
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
      # @param client [Trycourier::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
