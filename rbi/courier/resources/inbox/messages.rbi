# typed: strong

module Courier
  module Resources
    class Inbox
      # Manage the messages in a user's in-app inbox.
      class Messages
        # Delete a user's inbox message. The message is removed from every inbox read (it
        # stops appearing in the recipient's Inbox); it can be restored.
        sig do
          params(
            message_id: String,
            request_options: Courier::RequestOptions::OrHash
          ).void
        end
        def delete(
          # The message ID of the inbox message to delete.
          message_id,
          request_options: {}
        )
        end

        # Restore a previously deleted inbox message.
        sig do
          params(
            message_id: String,
            request_options: Courier::RequestOptions::OrHash
          ).void
        end
        def restore(
          # The message ID of the inbox message to restore.
          message_id,
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
end
