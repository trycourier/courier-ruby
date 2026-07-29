# typed: strong

module Courier
  module Resources
    class Inbox
      # Manage the messages in a user's in-app inbox.
      sig { returns(Courier::Resources::Inbox::Messages) }
      attr_reader :messages

      # @api private
      sig { params(client: Courier::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
