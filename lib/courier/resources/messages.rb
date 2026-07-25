# frozen_string_literal: true

module Courier
  module Resources
    class Messages
      # Some parameter documentations has been truncated, see
      # {Courier::Models::MessageRetrieveParams} for more details.
      #
      # Returns a sent message's status, recipient, event, and per-provider delivery
      # detail, with timestamps for enqueued, sent, delivered, opened, and clicked.
      #
      # @overload retrieve(message_id, request_options: {})
      #
      # @param message_id [String] A unique identifier associated with the message you wish to retrieve (results fr
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::MessageRetrieveResponse]
      #
      # @see Courier::Models::MessageRetrieveParams
      def retrieve(message_id, params = {})
        @client.request(
          method: :get,
          path: ["messages/%1$s", message_id],
          model: Courier::Models::MessageRetrieveResponse,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Courier::Models::MessageListParams} for more details.
      #
      # Returns previously sent messages, most recent first, each carrying its status,
      # recipient, channel, and provider. Paged by cursor.
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
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::MessageListResponse]
      #
      # @see Courier::Models::MessageListParams
      def list(params = {})
        parsed, options = Courier::MessageListParams.dump_request(params)
        query = Courier::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "messages",
          query: query.transform_keys(message_id: "messageId", trace_id: "traceId"),
          model: Courier::Models::MessageListResponse,
          options: options
        )
      end

      # Cancels a message that is still in the delivery pipeline and returns the message
      # record with its resulting canceled or failed status.
      #
      # @overload cancel(message_id, request_options: {})
      #
      # @param message_id [String] A unique identifier representing the message ID
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::MessageDetails]
      #
      # @see Courier::Models::MessageCancelParams
      def cancel(message_id, params = {})
        @client.request(
          method: :post,
          path: ["messages/%1$s/cancel", message_id],
          model: Courier::MessageDetails,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Courier::Models::MessageContentParams} for more details.
      #
      # Returns the rendered content Courier delivered for a message, broken out per
      # channel, to confirm what the recipient received.
      #
      # @overload content(message_id, request_options: {})
      #
      # @param message_id [String] A unique identifier associated with the message you wish to retrieve (results fr
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::MessageContentResponse]
      #
      # @see Courier::Models::MessageContentParams
      def content(message_id, params = {})
        @client.request(
          method: :get,
          path: ["messages/%1$s/output", message_id],
          model: Courier::Models::MessageContentResponse,
          options: params[:request_options]
        )
      end

      # Returns the ordered event history for a sent message, one entry per status
      # transition with its timestamp.
      #
      # @overload history(message_id, type: nil, request_options: {})
      #
      # @param message_id [String] A unique identifier representing the message ID
      #
      # @param type [String, nil] A supported Message History type that will filter the events returned.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::MessageHistoryResponse]
      #
      # @see Courier::Models::MessageHistoryParams
      def history(message_id, params = {})
        parsed, options = Courier::MessageHistoryParams.dump_request(params)
        query = Courier::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: ["messages/%1$s/history", message_id],
          query: query,
          model: Courier::Models::MessageHistoryResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Courier::Models::MessageResendParams} for more details.
      #
      # Resends a previously sent message to the same recipient and content, returning a
      # new messageId. The original send request is not modified.
      #
      # @overload resend(message_id, request_options: {})
      #
      # @param message_id [String] A unique identifier representing the message ID of the original message to resen
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::MessageResendResponse]
      #
      # @see Courier::Models::MessageResendParams
      def resend(message_id, params = {})
        @client.request(
          method: :post,
          path: ["messages/%1$s/resend", message_id],
          model: Courier::Models::MessageResendResponse,
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
