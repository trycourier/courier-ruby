# typed: strong

module Courier
  module Resources
    class Inbox
      sig { returns(Courier::Resources::Inbox::Messages) }
      attr_reader :messages

      # @api private
      sig { params(client: Courier::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
