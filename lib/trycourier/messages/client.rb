# frozen_string_literal: true

require_relative "../../requests"
require_relative "types/list_messages_response"
require_relative "types/message_details"
require_relative "types/message_history_response"
require_relative "types/render_output_response"
require "async"

module Courier
  class MessagesClient
    attr_reader :request_client

    # @param request_client [RequestClient]
    # @return [MessagesClient]
    def initialize(request_client:)
      # @type [RequestClient]
      @request_client = request_client
    end

    # Fetch the statuses of messages you've previously sent.
    #
    # @param archived [Boolean] A boolean value that indicates whether archived messages should be included in the response.
    # @param cursor [String] A unique identifier that allows for fetching the next set of message statuses.
    # @param event [String] A unique identifier representing the event that was used to send the event.
    # @param list [String] A unique identifier representing the list the message was sent to.
    # @param message_id [String] A unique identifier representing the message_id returned from either /send or /send/list.
    # @param notification [String] A unique identifier representing the notification that was used to send the event.
    # @param recipient [String] A unique identifier representing the recipient associated with the requested profile.
    # @param status [String] An indicator of the current status of the message. Multiple status values can be passed in.
    # @param tags [String] A comma delimited list of 'tags'. Messages will be returned if they match any of the tags passed in.
    # @param enqueued_after [String] The enqueued datetime of a message to filter out messages received before.
    # @param trace_id [String] The unique identifier used to trace the requests
    # @param request_options [RequestOptions]
    # @return [Messages::ListMessagesResponse]
    def list(archived: nil, cursor: nil, event: nil, list: nil, message_id: nil, notification: nil, recipient: nil,
             status: nil, tags: nil, enqueued_after: nil, trace_id: nil, request_options: nil)
      response = @request_client.conn.get("/messages") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.params = {
          **(request_options&.additional_query_parameters || {}),
          "archived": archived,
          "cursor": cursor,
          "event": event,
          "list": list,
          "messageId": message_id,
          "notification": notification,
          "recipient": recipient,
          "status": status,
          "tags": tags,
          "enqueued_after": enqueued_after,
          "traceId": trace_id
        }.compact
      end
      Messages::ListMessagesResponse.from_json(json_object: response.body)
    end

    # Fetch the status of a message you've previously sent.
    #
    # @param message_id [String] A unique identifier associated with the message you wish to retrieve (results from a send).
    # @param request_options [RequestOptions]
    # @return [Messages::MessageDetails]
    def get(message_id:, request_options: nil)
      response = @request_client.conn.get("/messages/#{message_id}") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
      end
      Messages::MessageDetails.from_json(json_object: response.body)
    end

    # Cancel a message that is currently in the process of being delivered. A well-formatted API call to the cancel message API will return either `200` status code for a successful cancellation or `409` status code for an unsuccessful cancellation. Both cases will include the actual message record in the response body (see details below).
    #
    # @param message_id [String] A unique identifier representing the message ID
    # @param request_options [IdempotencyRequestOptions]
    # @return [Messages::MessageDetails]
    def cancel(message_id:, request_options: nil)
      response = @request_client.conn.post("/messages/#{message_id}/cancel") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers["Idempotency-Key"] = request_options.idempotency_key unless request_options&.idempotency_key.nil?
        unless request_options&.idempotency_expiry.nil?
          req.headers["X-Idempotency-Expiration"] = request_options.idempotency_expiry
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
      end
      Messages::MessageDetails.from_json(json_object: response.body)
    end

    # Fetch the array of events of a message you've previously sent.
    #
    # @param message_id [String] A unique identifier representing the message ID
    # @param type [String] A supported Message History type that will filter the events returned.
    # @param request_options [RequestOptions]
    # @return [Messages::MessageHistoryResponse]
    def get_history(message_id:, type: nil, request_options: nil)
      response = @request_client.conn.get("/messages/#{message_id}/history") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.params = { **(request_options&.additional_query_parameters || {}), "type": type }.compact
      end
      Messages::MessageHistoryResponse.from_json(json_object: response.body)
    end

    # @param message_id [String] A unique identifier associated with the message you wish to retrieve (results from a send).
    # @param request_options [RequestOptions]
    # @return [Messages::RenderOutputResponse]
    def get_content(message_id:, request_options: nil)
      response = @request_client.conn.get("/messages/#{message_id}/output") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
      end
      Messages::RenderOutputResponse.from_json(json_object: response.body)
    end

    # @param request_id [String] A unique identifier representing the request ID
    # @param request_options [RequestOptions]
    # @return [Void]
    def archive(request_id:, request_options: nil)
      @request_client.conn.put("/requests/#{request_id}/archive") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
      end
    end
  end

  class AsyncMessagesClient
    attr_reader :request_client

    # @param request_client [AsyncRequestClient]
    # @return [AsyncMessagesClient]
    def initialize(request_client:)
      # @type [AsyncRequestClient]
      @request_client = request_client
    end

    # Fetch the statuses of messages you've previously sent.
    #
    # @param archived [Boolean] A boolean value that indicates whether archived messages should be included in the response.
    # @param cursor [String] A unique identifier that allows for fetching the next set of message statuses.
    # @param event [String] A unique identifier representing the event that was used to send the event.
    # @param list [String] A unique identifier representing the list the message was sent to.
    # @param message_id [String] A unique identifier representing the message_id returned from either /send or /send/list.
    # @param notification [String] A unique identifier representing the notification that was used to send the event.
    # @param recipient [String] A unique identifier representing the recipient associated with the requested profile.
    # @param status [String] An indicator of the current status of the message. Multiple status values can be passed in.
    # @param tags [String] A comma delimited list of 'tags'. Messages will be returned if they match any of the tags passed in.
    # @param enqueued_after [String] The enqueued datetime of a message to filter out messages received before.
    # @param trace_id [String] The unique identifier used to trace the requests
    # @param request_options [RequestOptions]
    # @return [Messages::ListMessagesResponse]
    def list(archived: nil, cursor: nil, event: nil, list: nil, message_id: nil, notification: nil, recipient: nil,
             status: nil, tags: nil, enqueued_after: nil, trace_id: nil, request_options: nil)
      Async do
        response = @request_client.conn.get("/messages") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "archived": archived,
            "cursor": cursor,
            "event": event,
            "list": list,
            "messageId": message_id,
            "notification": notification,
            "recipient": recipient,
            "status": status,
            "tags": tags,
            "enqueued_after": enqueued_after,
            "traceId": trace_id
          }.compact
        end
        Messages::ListMessagesResponse.from_json(json_object: response.body)
      end
    end

    # Fetch the status of a message you've previously sent.
    #
    # @param message_id [String] A unique identifier associated with the message you wish to retrieve (results from a send).
    # @param request_options [RequestOptions]
    # @return [Messages::MessageDetails]
    def get(message_id:, request_options: nil)
      Async do
        response = @request_client.conn.get("/messages/#{message_id}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
        Messages::MessageDetails.from_json(json_object: response.body)
      end
    end

    # Cancel a message that is currently in the process of being delivered. A well-formatted API call to the cancel message API will return either `200` status code for a successful cancellation or `409` status code for an unsuccessful cancellation. Both cases will include the actual message record in the response body (see details below).
    #
    # @param message_id [String] A unique identifier representing the message ID
    # @param request_options [IdempotencyRequestOptions]
    # @return [Messages::MessageDetails]
    def cancel(message_id:, request_options: nil)
      Async do
        response = @request_client.conn.post("/messages/#{message_id}/cancel") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers["Idempotency-Key"] = request_options.idempotency_key unless request_options&.idempotency_key.nil?
          unless request_options&.idempotency_expiry.nil?
            req.headers["X-Idempotency-Expiration"] = request_options.idempotency_expiry
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
        Messages::MessageDetails.from_json(json_object: response.body)
      end
    end

    # Fetch the array of events of a message you've previously sent.
    #
    # @param message_id [String] A unique identifier representing the message ID
    # @param type [String] A supported Message History type that will filter the events returned.
    # @param request_options [RequestOptions]
    # @return [Messages::MessageHistoryResponse]
    def get_history(message_id:, type: nil, request_options: nil)
      Async do
        response = @request_client.conn.get("/messages/#{message_id}/history") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = { **(request_options&.additional_query_parameters || {}), "type": type }.compact
        end
        Messages::MessageHistoryResponse.from_json(json_object: response.body)
      end
    end

    # @param message_id [String] A unique identifier associated with the message you wish to retrieve (results from a send).
    # @param request_options [RequestOptions]
    # @return [Messages::RenderOutputResponse]
    def get_content(message_id:, request_options: nil)
      Async do
        response = @request_client.conn.get("/messages/#{message_id}/output") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
        Messages::RenderOutputResponse.from_json(json_object: response.body)
      end
    end

    # @param request_id [String] A unique identifier representing the request ID
    # @param request_options [RequestOptions]
    # @return [Void]
    def archive(request_id:, request_options: nil)
      Async do
        @request_client.conn.put("/requests/#{request_id}/archive") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
      end
    end
  end
end
