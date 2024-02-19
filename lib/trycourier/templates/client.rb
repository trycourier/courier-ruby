# frozen_string_literal: true

require_relative "../../requests"
require_relative "types/list_templates_response"
require "async"

module Courier
  class TemplatesClient
    attr_reader :request_client

    # @param request_client [RequestClient]
    # @return [TemplatesClient]
    def initialize(request_client:)
      # @type [RequestClient]
      @request_client = request_client
    end

    # Returns a list of notification templates
    #
    # @param cursor [String] A unique identifier that allows for fetching the next set of templates
    # @param request_options [RequestOptions]
    # @return [Templates::ListTemplatesResponse]
    def list(cursor: nil, request_options: nil)
      response = @request_client.conn.get("/notifications") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.params = { **(request_options&.additional_query_parameters || {}), "cursor": cursor }.compact
      end
      Templates::ListTemplatesResponse.from_json(json_object: response.body)
    end
  end

  class AsyncTemplatesClient
    attr_reader :request_client

    # @param request_client [AsyncRequestClient]
    # @return [AsyncTemplatesClient]
    def initialize(request_client:)
      # @type [AsyncRequestClient]
      @request_client = request_client
    end

    # Returns a list of notification templates
    #
    # @param cursor [String] A unique identifier that allows for fetching the next set of templates
    # @param request_options [RequestOptions]
    # @return [Templates::ListTemplatesResponse]
    def list(cursor: nil, request_options: nil)
      Async do
        response = @request_client.conn.get("/notifications") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = { **(request_options&.additional_query_parameters || {}), "cursor": cursor }.compact
        end
        Templates::ListTemplatesResponse.from_json(json_object: response.body)
      end
    end
  end
end
