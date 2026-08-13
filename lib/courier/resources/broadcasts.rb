# frozen_string_literal: true

module Courier
  module Resources
    # Create a one-off send to a list or audience, author its content, then send it
    # immediately or schedule it for later.
    class Broadcasts
      # Create a broadcast. Provisions a private notification template for the broadcast
      # and returns the new broadcast in the draft state. Exactly one channel is
      # required.
      #
      # @overload create(channel:, name:, request_options: {})
      #
      # @param channel [Symbol, Courier::Models::CreateBroadcastRequest::Channel] The single delivery channel for this broadcast.
      #
      # @param name [String] Human-readable name.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::Broadcast]
      #
      # @see Courier::Models::BroadcastCreateParams
      def create(params)
        parsed, options = Courier::BroadcastCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "broadcasts",
          body: parsed,
          model: Courier::Broadcast,
          options: options
        )
      end

      # Retrieve a broadcast by ID. Archived broadcasts return 404.
      #
      # @overload retrieve(broadcast_id, request_options: {})
      #
      # @param broadcast_id [String] The broadcast to retrieve, identified by the `id` returned when it was created.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::Broadcast]
      #
      # @see Courier::Models::BroadcastRetrieveParams
      def retrieve(broadcast_id, params = {})
        @client.request(
          method: :get,
          path: ["broadcasts/%1$s", broadcast_id],
          model: Courier::Broadcast,
          options: params[:request_options]
        )
      end

      # Update a broadcast's name. Content is edited via the broadcast's notification
      # template, not this endpoint.
      #
      # @overload update(broadcast_id, name:, request_options: {})
      #
      # @param broadcast_id [String] The broadcast to rename.
      #
      # @param name [String] New human-readable name.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::Broadcast]
      #
      # @see Courier::Models::BroadcastUpdateParams
      def update(broadcast_id, params)
        parsed, options = Courier::BroadcastUpdateParams.dump_request(params)
        @client.request(
          method: :put,
          path: ["broadcasts/%1$s", broadcast_id],
          body: parsed,
          model: Courier::Broadcast,
          options: options
        )
      end

      # List broadcasts in your workspace. Cursor-paginated; returns broadcasts
      # newest-first.
      #
      # @overload list(cursor: nil, limit: nil, request_options: {})
      #
      # @param cursor [String, nil] Opaque pagination cursor from a previous response. Omit for the first page.
      #
      # @param limit [Integer] Maximum number of results per page.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::BroadcastListResponse]
      #
      # @see Courier::Models::BroadcastListParams
      def list(params = {})
        parsed, options = Courier::BroadcastListParams.dump_request(params)
        query = Courier::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "broadcasts",
          query: query,
          model: Courier::BroadcastListResponse,
          options: options
        )
      end

      # Archive a broadcast. This is a soft delete — the archived broadcast is returned
      # and no longer appears in list results.
      #
      # @overload archive(broadcast_id, request_options: {})
      #
      # @param broadcast_id [String] The broadcast to archive.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::Broadcast]
      #
      # @see Courier::Models::BroadcastArchiveParams
      def archive(broadcast_id, params = {})
        @client.request(
          method: :delete,
          path: ["broadcasts/%1$s", broadcast_id],
          model: Courier::Broadcast,
          options: params[:request_options]
        )
      end

      # Cancel a broadcast's pending schedule, returning it to the draft state. Only
      # valid for a scheduled broadcast.
      #
      # @overload cancel(broadcast_id, request_options: {})
      #
      # @param broadcast_id [String] The broadcast to cancel.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::Broadcast]
      #
      # @see Courier::Models::BroadcastCancelParams
      def cancel(broadcast_id, params = {})
        @client.request(
          method: :post,
          path: ["broadcasts/%1$s/cancel", broadcast_id],
          model: Courier::Broadcast,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Courier::Models::BroadcastDuplicateParams} for more details.
      #
      # Duplicate a broadcast (and its template) into a new draft named "{source name}
      # (copy)".
      #
      # @overload duplicate(broadcast_id, request_options: {})
      #
      # @param broadcast_id [String] The broadcast to copy. The duplicate is created as a new draft and this broadcas
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::Broadcast]
      #
      # @see Courier::Models::BroadcastDuplicateParams
      def duplicate(broadcast_id, params = {})
        @client.request(
          method: :post,
          path: ["broadcasts/%1$s/duplicate", broadcast_id],
          model: Courier::Broadcast,
          options: params[:request_options]
        )
      end

      # Author the broadcast's content by replacing the draft elemental content of its
      # private notification template. The draft is published automatically when the
      # broadcast is sent or scheduled.
      #
      # @overload put_content(broadcast_id, content:, state: nil, request_options: {})
      #
      # @param broadcast_id [String] The broadcast whose content you want to replace.
      #
      # @param content [Courier::Models::NotificationContentPutRequest::Content] Elemental content payload. The server defaults `version` when omitted.
      #
      # @param state [Symbol, Courier::Models::NotificationTemplateState] Template state. Defaults to `DRAFT`.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::NotificationContentMutationResponse]
      #
      # @see Courier::Models::BroadcastPutContentParams
      def put_content(broadcast_id, params)
        parsed, options = Courier::BroadcastPutContentParams.dump_request(params)
        @client.request(
          method: :put,
          path: ["broadcasts/%1$s/content", broadcast_id],
          body: parsed,
          model: Courier::NotificationContentMutationResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Courier::Models::BroadcastRetrieveContentParams} for more details.
      #
      # Retrieve the broadcast's content — the elemental content of its private
      # notification template. Defaults to the working draft, since broadcast content is
      # authored as a draft until the broadcast is sent.
      #
      # @overload retrieve_content(broadcast_id, version: nil, request_options: {})
      #
      # @param broadcast_id [String] The broadcast whose content you want to read.
      #
      # @param version [String] Accepts `draft`, `published`, or a version string (e.g. `v001`). Defaults to `dr
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::NotificationContentGetResponse]
      #
      # @see Courier::Models::BroadcastRetrieveContentParams
      def retrieve_content(broadcast_id, params = {})
        parsed, options = Courier::BroadcastRetrieveContentParams.dump_request(params)
        query = Courier::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: ["broadcasts/%1$s/content", broadcast_id],
          query: query,
          model: Courier::NotificationContentGetResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Courier::Models::BroadcastScheduleParams} for more details.
      #
      # Schedule a broadcast for a future send to a list or audience. Publishes the
      # broadcast template first. Not allowed once the broadcast is sending or sent. For
      # an immediate send use POST /broadcasts/{broadcastId}/send.
      #
      # @overload schedule(broadcast_id, recipient_id:, recipient_type:, scheduled_to:, timezone: nil, request_options: {})
      #
      # @param broadcast_id [String] The broadcast to schedule.
      #
      # @param recipient_id [String] ID of the target list or audience.
      #
      # @param recipient_type [Symbol, Courier::Models::ScheduleBroadcastRequest::RecipientType] Whether the broadcast targets a list or an audience.
      #
      # @param scheduled_to [String] Wall-clock timestamp of the future send, no timezone offset (e.g. "2026-07-21T20
      #
      # @param timezone [String] IANA timezone for the scheduled send (e.g. America/New_York).
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::Broadcast]
      #
      # @see Courier::Models::BroadcastScheduleParams
      def schedule(broadcast_id, params)
        parsed, options = Courier::BroadcastScheduleParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["broadcasts/%1$s/schedule", broadcast_id],
          body: parsed,
          model: Courier::Broadcast,
          options: options
        )
      end

      # Send a broadcast immediately to a list or audience. Publishes the broadcast
      # template first. Not allowed once the broadcast is sending or sent.
      #
      # @overload send_(broadcast_id, recipient_id:, recipient_type:, request_options: {})
      #
      # @param broadcast_id [String] The broadcast to send.
      #
      # @param recipient_id [String] ID of the target list or audience.
      #
      # @param recipient_type [Symbol, Courier::Models::SendBroadcastRequest::RecipientType] Whether the broadcast targets a list or an audience.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::Broadcast]
      #
      # @see Courier::Models::BroadcastSendParams
      def send_(broadcast_id, params)
        parsed, options = Courier::BroadcastSendParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["broadcasts/%1$s/send", broadcast_id],
          body: parsed,
          model: Courier::Broadcast,
          options: options
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
