# frozen_string_literal: true

require_relative "../../requests"
require_relative "types/brand_parameters"
require_relative "types/brand"
require_relative "types/brands_response"
require_relative "types/brand_settings"
require_relative "types/brand_snippets"
require "async"

module Courier
  class BrandsClient
    attr_reader :request_client

    # @param request_client [RequestClient]
    # @return [BrandsClient]
    def initialize(request_client:)
      # @type [RequestClient]
      @request_client = request_client
    end

    # @param request [Hash] Request of type Brands::BrandParameters, as a Hash
    #   * :id (String)
    #   * :name (String)
    #   * :settings (Hash)
    #     * :colors (Hash)
    #       * :primary (String)
    #       * :secondary (String)
    #       * :tertiary (String)
    #     * :inapp (Object)
    #     * :email (Hash)
    #       * :footer (Object)
    #       * :header (Object)
    #   * :snippets (Hash)
    #     * :items (Array<Brands::BrandSnippet>)
    # @param request_options [RequestOptions]
    # @return [Brands::Brand]
    def create(request:, request_options: nil)
      response = @request_client.conn.post("/brands") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
      end
      Brands::Brand.from_json(json_object: response.body)
    end

    # Fetch a specific brand by brand ID.
    #
    # @param brand_id [String] A unique identifier associated with the brand you wish to retrieve.
    # @param request_options [RequestOptions]
    # @return [Brands::Brand]
    def get(brand_id:, request_options: nil)
      response = @request_client.conn.get("/brands/#{brand_id}") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
      end
      Brands::Brand.from_json(json_object: response.body)
    end

    # Get the list of brands.
    #
    # @param cursor [String] A unique identifier that allows for fetching the next set of brands.
    # @param request_options [RequestOptions]
    # @return [Brands::BrandsResponse]
    def list(cursor: nil, request_options: nil)
      response = @request_client.conn.get("/brands") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.params = { **(request_options&.additional_query_parameters || {}), "cursor": cursor }.compact
      end
      Brands::BrandsResponse.from_json(json_object: response.body)
    end

    # Delete a brand by brand ID.
    #
    # @param brand_id [String] A unique identifier associated with the brand you wish to retrieve.
    # @param request_options [RequestOptions]
    # @return [Void]
    def delete(brand_id:, request_options: nil)
      @request_client.conn.delete("/brands/#{brand_id}") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
      end
    end

    # Replace an existing brand with the supplied values.
    #
    # @param brand_id [String] A unique identifier associated with the brand you wish to update.
    # @param name [String] The name of the brand.
    # @param settings [Hash] Request of type Brands::BrandSettings, as a Hash
    #   * :colors (Hash)
    #     * :primary (String)
    #     * :secondary (String)
    #     * :tertiary (String)
    #   * :inapp (Object)
    #   * :email (Hash)
    #     * :footer (Object)
    #     * :header (Object)
    # @param snippets [Hash] Request of type Brands::BrandSnippets, as a Hash
    #   * :items (Array<Brands::BrandSnippet>)
    # @param request_options [RequestOptions]
    # @return [Brands::Brand]
    def replace(brand_id:, name:, settings: nil, snippets: nil, request_options: nil)
      response = @request_client.conn.put("/brands/#{brand_id}") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          name: name,
          settings: settings,
          snippets: snippets
        }.compact
      end
      Brands::Brand.from_json(json_object: response.body)
    end
  end

  class AsyncBrandsClient
    attr_reader :request_client

    # @param request_client [AsyncRequestClient]
    # @return [AsyncBrandsClient]
    def initialize(request_client:)
      # @type [AsyncRequestClient]
      @request_client = request_client
    end

    # @param request [Hash] Request of type Brands::BrandParameters, as a Hash
    #   * :id (String)
    #   * :name (String)
    #   * :settings (Hash)
    #     * :colors (Hash)
    #       * :primary (String)
    #       * :secondary (String)
    #       * :tertiary (String)
    #     * :inapp (Object)
    #     * :email (Hash)
    #       * :footer (Object)
    #       * :header (Object)
    #   * :snippets (Hash)
    #     * :items (Array<Brands::BrandSnippet>)
    # @param request_options [RequestOptions]
    # @return [Brands::Brand]
    def create(request:, request_options: nil)
      Async do
        response = @request_client.conn.post("/brands") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
        end
        Brands::Brand.from_json(json_object: response.body)
      end
    end

    # Fetch a specific brand by brand ID.
    #
    # @param brand_id [String] A unique identifier associated with the brand you wish to retrieve.
    # @param request_options [RequestOptions]
    # @return [Brands::Brand]
    def get(brand_id:, request_options: nil)
      Async do
        response = @request_client.conn.get("/brands/#{brand_id}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
        Brands::Brand.from_json(json_object: response.body)
      end
    end

    # Get the list of brands.
    #
    # @param cursor [String] A unique identifier that allows for fetching the next set of brands.
    # @param request_options [RequestOptions]
    # @return [Brands::BrandsResponse]
    def list(cursor: nil, request_options: nil)
      Async do
        response = @request_client.conn.get("/brands") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = { **(request_options&.additional_query_parameters || {}), "cursor": cursor }.compact
        end
        Brands::BrandsResponse.from_json(json_object: response.body)
      end
    end

    # Delete a brand by brand ID.
    #
    # @param brand_id [String] A unique identifier associated with the brand you wish to retrieve.
    # @param request_options [RequestOptions]
    # @return [Void]
    def delete(brand_id:, request_options: nil)
      Async do
        @request_client.conn.delete("/brands/#{brand_id}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
      end
    end

    # Replace an existing brand with the supplied values.
    #
    # @param brand_id [String] A unique identifier associated with the brand you wish to update.
    # @param name [String] The name of the brand.
    # @param settings [Hash] Request of type Brands::BrandSettings, as a Hash
    #   * :colors (Hash)
    #     * :primary (String)
    #     * :secondary (String)
    #     * :tertiary (String)
    #   * :inapp (Object)
    #   * :email (Hash)
    #     * :footer (Object)
    #     * :header (Object)
    # @param snippets [Hash] Request of type Brands::BrandSnippets, as a Hash
    #   * :items (Array<Brands::BrandSnippet>)
    # @param request_options [RequestOptions]
    # @return [Brands::Brand]
    def replace(brand_id:, name:, settings: nil, snippets: nil, request_options: nil)
      Async do
        response = @request_client.conn.put("/brands/#{brand_id}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            name: name,
            settings: settings,
            snippets: snippets
          }.compact
        end
        Brands::Brand.from_json(json_object: response.body)
      end
    end
  end
end
