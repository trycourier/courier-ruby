# typed: strong

module Courier
  module Resources
    # Create a one-off send to a list or audience, author its content, then send it
    # immediately or schedule it for later.
    class Broadcasts
      # Create a broadcast. Provisions a private notification template for the broadcast
      # and returns the new broadcast in the draft state. Exactly one channel is
      # required.
      sig do
        params(
          channel: Courier::CreateBroadcastRequest::Channel::OrSymbol,
          name: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Broadcast)
      end
      def create(
        # The single delivery channel for this broadcast.
        channel:,
        # Human-readable name.
        name:,
        request_options: {}
      )
      end

      # Retrieve a broadcast by ID. Archived broadcasts return 404.
      sig do
        params(
          broadcast_id: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Broadcast)
      end
      def retrieve(broadcast_id, request_options: {})
      end

      # Update a broadcast's name. Content is edited via the broadcast's notification
      # template, not this endpoint.
      sig do
        params(
          broadcast_id: String,
          name: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Broadcast)
      end
      def update(
        broadcast_id,
        # New human-readable name.
        name:,
        request_options: {}
      )
      end

      # List broadcasts in your workspace. Cursor-paginated; returns broadcasts
      # newest-first.
      sig do
        params(
          cursor: T.nilable(String),
          limit: Integer,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::BroadcastListResponse)
      end
      def list(
        # Opaque pagination cursor from a previous response. Omit for the first page.
        cursor: nil,
        # Maximum number of results per page.
        limit: nil,
        request_options: {}
      )
      end

      # Archive a broadcast. This is a soft delete — the archived broadcast is returned
      # and no longer appears in list results.
      sig do
        params(
          broadcast_id: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Broadcast)
      end
      def archive(broadcast_id, request_options: {})
      end

      # Cancel a broadcast's pending schedule, returning it to the draft state. Only
      # valid for a scheduled broadcast.
      sig do
        params(
          broadcast_id: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Broadcast)
      end
      def cancel(broadcast_id, request_options: {})
      end

      # Duplicate a broadcast (and its template) into a new draft named "{source name}
      # (copy)".
      sig do
        params(
          broadcast_id: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Broadcast)
      end
      def duplicate(broadcast_id, request_options: {})
      end

      # Author the broadcast's content by replacing the draft elemental content of its
      # private notification template. The draft is published automatically when the
      # broadcast is sent or scheduled.
      sig do
        params(
          broadcast_id: String,
          content: Courier::NotificationContentPutRequest::Content::OrHash,
          state: Courier::NotificationTemplateState::OrSymbol,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::NotificationContentMutationResponse)
      end
      def put_content(
        broadcast_id,
        # Elemental content payload. The server defaults `version` when omitted.
        content:,
        # Template state. Defaults to `DRAFT`.
        state: nil,
        request_options: {}
      )
      end

      # Retrieve the broadcast's content — the elemental content of its private
      # notification template. Defaults to the working draft, since broadcast content is
      # authored as a draft until the broadcast is sent.
      sig do
        params(
          broadcast_id: String,
          version: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::NotificationContentGetResponse)
      end
      def retrieve_content(
        broadcast_id,
        # Accepts `draft`, `published`, or a version string (e.g. `v001`). Defaults to
        # `draft`.
        version: nil,
        request_options: {}
      )
      end

      # Schedule a broadcast for a future send to a list or audience. Publishes the
      # broadcast template first. Not allowed once the broadcast is sending or sent. For
      # an immediate send use POST /broadcasts/{broadcastId}/send.
      sig do
        params(
          broadcast_id: String,
          recipient_id: String,
          recipient_type:
            Courier::ScheduleBroadcastRequest::RecipientType::OrSymbol,
          scheduled_to: String,
          timezone: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Broadcast)
      end
      def schedule(
        broadcast_id,
        # ID of the target list or audience.
        recipient_id:,
        # Whether the broadcast targets a list or an audience.
        recipient_type:,
        # Wall-clock timestamp of the future send, no timezone offset (e.g.
        # "2026-07-21T20:00:00"). The zone is given by `timezone`.
        scheduled_to:,
        # IANA timezone for the scheduled send (e.g. America/New_York).
        timezone: nil,
        request_options: {}
      )
      end

      # Send a broadcast immediately to a list or audience. Publishes the broadcast
      # template first. Not allowed once the broadcast is sending or sent.
      sig do
        params(
          broadcast_id: String,
          recipient_id: String,
          recipient_type:
            Courier::SendBroadcastRequest::RecipientType::OrSymbol,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Broadcast)
      end
      def send_(
        broadcast_id,
        # ID of the target list or audience.
        recipient_id:,
        # Whether the broadcast targets a list or an audience.
        recipient_type:,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Courier::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
