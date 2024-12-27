# frozen_string_literal: true

require_relative "../../requests"
require "async"

module Courier
  class TranslationsClient
    attr_reader :request_client

    # @param request_client [RequestClient]
    # @return [TranslationsClient]
    def initialize(request_client:)
      # @type [RequestClient]
      @request_client = request_client
    end

    # Get translations by locale
    #
    # @param domain [String] The domain you want to retrieve translations for. Only `default` is supported at the moment
    # @param locale [String] The locale you want to retrieve the translations for
    # @param request_options [RequestOptions]
    # @return [String]
    def get(domain:, locale:, request_options: nil)
      response = @request_client.conn.get("/translations/#{domain}/#{locale}") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
      end
      response.body
    end

    # Update a translation
    #
    # @param domain [String] The domain you want to retrieve translations for. Only `default` is supported at the moment
    # @param locale [String] The locale you want to retrieve the translations for
    # @param request [String] .po file translation content
    # @param request_options [RequestOptions]
    # @return [Void]
    def update(domain:, locale:, request:, request_options: nil)
      @request_client.conn.put("/translations/#{domain}/#{locale}") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
      end
    end
  end

  class AsyncTranslationsClient
    attr_reader :request_client

    # @param request_client [AsyncRequestClient]
    # @return [AsyncTranslationsClient]
    def initialize(request_client:)
      # @type [AsyncRequestClient]
      @request_client = request_client
    end

    # Get translations by locale
    #
    # @param domain [String] The domain you want to retrieve translations for. Only `default` is supported at the moment
    # @param locale [String] The locale you want to retrieve the translations for
    # @param request_options [RequestOptions]
    # @return [String]
    def get(domain:, locale:, request_options: nil)
      Async do
        response = @request_client.conn.get("/translations/#{domain}/#{locale}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
        response.body
      end
    end

    # Update a translation
    #
    # @param domain [String] The domain you want to retrieve translations for. Only `default` is supported at the moment
    # @param locale [String] The locale you want to retrieve the translations for
    # @param request [String] .po file translation content
    # @param request_options [RequestOptions]
    # @return [Void]
    def update(domain:, locale:, request:, request_options: nil)
      Async do
        @request_client.conn.put("/translations/#{domain}/#{locale}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
        end
      end
    end
  end
end
