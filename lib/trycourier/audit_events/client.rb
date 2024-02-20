# frozen_string_literal: true

require_relative "../../requests"
require_relative "types/list_audit_events_response"
require_relative "types/audit_event"
require "async"

module Courier
  class AuditEventsClient
    attr_reader :request_client

    # @param request_client [RequestClient]
    # @return [AuditEventsClient]
    def initialize(request_client:)
      # @type [RequestClient]
      @request_client = request_client
    end

    # Fetch the list of audit events
    #
    # @param cursor [String] A unique identifier that allows for fetching the next set of audit events.
    # @param request_options [RequestOptions]
    # @return [AuditEvents::ListAuditEventsResponse]
    def list(cursor: nil, request_options: nil)
      response = @request_client.conn.get("/audit-events") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.params = { **(request_options&.additional_query_parameters || {}), "cursor": cursor }.compact
      end
      AuditEvents::ListAuditEventsResponse.from_json(json_object: response.body)
    end

    # Fetch a specific audit event by ID.
    #
    # @param audit_event_id [String] A unique identifier associated with the audit event you wish to retrieve
    # @param request_options [RequestOptions]
    # @return [AuditEvents::AuditEvent]
    def get(audit_event_id:, request_options: nil)
      response = @request_client.conn.get("/audit-events/#{audit_event_id}") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
      end
      AuditEvents::AuditEvent.from_json(json_object: response.body)
    end
  end

  class AsyncAuditEventsClient
    attr_reader :request_client

    # @param request_client [AsyncRequestClient]
    # @return [AsyncAuditEventsClient]
    def initialize(request_client:)
      # @type [AsyncRequestClient]
      @request_client = request_client
    end

    # Fetch the list of audit events
    #
    # @param cursor [String] A unique identifier that allows for fetching the next set of audit events.
    # @param request_options [RequestOptions]
    # @return [AuditEvents::ListAuditEventsResponse]
    def list(cursor: nil, request_options: nil)
      Async do
        response = @request_client.conn.get("/audit-events") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = { **(request_options&.additional_query_parameters || {}), "cursor": cursor }.compact
        end
        AuditEvents::ListAuditEventsResponse.from_json(json_object: response.body)
      end
    end

    # Fetch a specific audit event by ID.
    #
    # @param audit_event_id [String] A unique identifier associated with the audit event you wish to retrieve
    # @param request_options [RequestOptions]
    # @return [AuditEvents::AuditEvent]
    def get(audit_event_id:, request_options: nil)
      Async do
        response = @request_client.conn.get("/audit-events/#{audit_event_id}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
        AuditEvents::AuditEvent.from_json(json_object: response.body)
      end
    end
  end
end
