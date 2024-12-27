# frozen_string_literal: true

require_relative "../../requests"
require_relative "types/inbound_track_event"
require_relative "types/track_accepted_response"
require "async"

module Courier
  class InboundClient
    attr_reader :request_client

    # @param request_client [RequestClient]
    # @return [InboundClient]
    def initialize(request_client:)
      # @type [RequestClient]
      @request_client = request_client
    end

    # @param request [Hash] Request of type Inbound::InboundTrackEvent, as a Hash
    #   * :event (String)
    #   * :message_id (String)
    #   * :properties (Hash{String => String})
    #   * :type (String)
    #   * :user_id (String)
    # @param request_options [RequestOptions]
    # @return [Inbound::TrackAcceptedResponse]
    def track(request:, request_options: nil)
      response = @request_client.conn.post("/inbound/courier") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
      end
      Inbound::TrackAcceptedResponse.from_json(json_object: response.body)
    end
  end

  class AsyncInboundClient
    attr_reader :request_client

    # @param request_client [AsyncRequestClient]
    # @return [AsyncInboundClient]
    def initialize(request_client:)
      # @type [AsyncRequestClient]
      @request_client = request_client
    end

    # @param request [Hash] Request of type Inbound::InboundTrackEvent, as a Hash
    #   * :event (String)
    #   * :message_id (String)
    #   * :properties (Hash{String => String})
    #   * :type (String)
    #   * :user_id (String)
    # @param request_options [RequestOptions]
    # @return [Inbound::TrackAcceptedResponse]
    def track(request:, request_options: nil)
      Async do
        response = @request_client.conn.post("/inbound/courier") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
        end
        Inbound::TrackAcceptedResponse.from_json(json_object: response.body)
      end
    end
  end
end
