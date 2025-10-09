# frozen_string_literal: true

module Trycourier
  module Resources
    class Messages
      # Some parameter documentations has been truncated, see
      # {Trycourier::Models::MessageRetrieveParams} for more details.
      #
      # Fetch the status of a message you've previously sent.
      #
      # @overload retrieve(message_id, request_options: {})
      #
      # @param message_id [String] A unique identifier associated with the message you wish to retrieve (results fr
      #
      # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Trycourier::Models::MessageRetrieveResponse]
      #
      # @see Trycourier::Models::MessageRetrieveParams
      def retrieve(message_id, params = {})
        @client.request(
          method: :get,
          path: ["messages/%1$s", message_id],
          model: Trycourier::Models::MessageRetrieveResponse,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Trycourier::Models::MessageListParams} for more details.
      #
      # Fetch the statuses of messages you've previously sent.
      #
      # @overload list(archived: nil, cursor: nil, enqueued_after: nil, event: nil, list: nil, message_id: nil, notification: nil, provider: nil, recipient: nil, status: nil, tag: nil, tags: nil, tenant_id: nil, trace_id: nil, request_options: {})
      #
      # @param archived [Boolean, nil] A boolean value that indicates whether archived messages should be included in t
      #
      # @param cursor [String, nil] A unique identifier that allows for fetching the next set of messages.
      #
      # @param enqueued_after [String, nil] The enqueued datetime of a message to filter out messages received before.
      #
      # @param event [String, nil] A unique identifier representing the event that was used to send the event.
      #
      # @param list [String, nil] A unique identifier representing the list the message was sent to.
      #
      # @param message_id [String, nil] A unique identifier representing the message_id returned from either /send or /s
      #
      # @param notification [String, nil] A unique identifier representing the notification that was used to send the even
      #
      # @param provider [Array<String, nil>] The key assocated to the provider you want to filter on. E.g., sendgrid, inbox,
      #
      # @param recipient [String, nil] A unique identifier representing the recipient associated with the requested pro
      #
      # @param status [Array<String, nil>] An indicator of the current status of the message. Allows multiple values to be
      #
      # @param tag [Array<String, nil>] A tag placed in the metadata.tags during a notification send. Allows multiple va
      #
      # @param tags [String, nil] A comma delimited list of 'tags'. Messages will be returned if they match any of
      #
      # @param tenant_id [String, nil] Messages sent with the context of a Tenant
      #
      # @param trace_id [String, nil] The unique identifier used to trace the requests
      #
      # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Trycourier::Models::MessageListResponse]
      #
      # @see Trycourier::Models::MessageListParams
      def list(params = {})
        parsed, options = Trycourier::MessageListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "messages",
          query: parsed.transform_keys(message_id: "messageId", trace_id: "traceId"),
          model: Trycourier::Models::MessageListResponse,
          options: options
        )
      end

      # Cancel a message that is currently in the process of being delivered. A
      # well-formatted API call to the cancel message API will return either `200`
      # status code for a successful cancellation or `409` status code for an
      # unsuccessful cancellation. Both cases will include the actual message record in
      # the response body (see details below).
      #
      # @overload cancel(message_id, request_options: {})
      #
      # @param message_id [String] A unique identifier representing the message ID
      #
      # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Trycourier::Models::MessageDetails]
      #
      # @see Trycourier::Models::MessageCancelParams
      def cancel(message_id, params = {})
        @client.request(
          method: :post,
          path: ["messages/%1$s/cancel", message_id],
          model: Trycourier::MessageDetails,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Trycourier::Models::MessageContentParams} for more details.
      #
      # Get message content
      #
      # @overload content(message_id, request_options: {})
      #
      # @param message_id [String] A unique identifier associated with the message you wish to retrieve (results fr
      #
      # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Trycourier::Models::MessageContentResponse]
      #
      # @see Trycourier::Models::MessageContentParams
      def content(message_id, params = {})
        @client.request(
          method: :get,
          path: ["messages/%1$s/output", message_id],
          model: Trycourier::Models::MessageContentResponse,
          options: params[:request_options]
        )
      end

      # Fetch the array of events of a message you've previously sent.
      #
      # @overload history(message_id, type: nil, request_options: {})
      #
      # @param message_id [String] A unique identifier representing the message ID
      #
      # @param type [String, nil] A supported Message History type that will filter the events returned.
      #
      # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Trycourier::Models::MessageHistoryResponse]
      #
      # @see Trycourier::Models::MessageHistoryParams
      def history(message_id, params = {})
        parsed, options = Trycourier::MessageHistoryParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["messages/%1$s/history", message_id],
          query: parsed,
          model: Trycourier::Models::MessageHistoryResponse,
          options: options
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
