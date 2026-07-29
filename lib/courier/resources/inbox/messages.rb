# frozen_string_literal: true

module Courier
  module Resources
    class Inbox
      # Manage the messages in a user's in-app inbox.
      class Messages
        # Delete a user's inbox message. The message is removed from every inbox read (it
        # stops appearing in the recipient's Inbox); it can be restored.
        #
        # @overload delete(message_id, request_options: {})
        #
        # @param message_id [String] The message ID of the inbox message to delete.
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Courier::Models::Inbox::MessageDeleteParams
        def delete(message_id, params = {})
          @client.request(
            method: :delete,
            path: ["inbox/messages/%1$s", message_id],
            model: NilClass,
            options: params[:request_options]
          )
        end

        # Restore a previously deleted inbox message.
        #
        # @overload restore(message_id, request_options: {})
        #
        # @param message_id [String] The message ID of the inbox message to restore.
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Courier::Models::Inbox::MessageRestoreParams
        def restore(message_id, params = {})
          @client.request(
            method: :put,
            path: ["inbox/messages/%1$s/restore", message_id],
            model: NilClass,
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
end
