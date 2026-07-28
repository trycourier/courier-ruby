# frozen_string_literal: true

module Courier
  module Resources
    class Inbox
      # @return [Courier::Resources::Inbox::Messages]
      attr_reader :messages

      # @api private
      #
      # @param client [Courier::Client]
      def initialize(client:)
        @client = client
        @messages = Courier::Resources::Inbox::Messages.new(client: client)
      end
    end
  end
end
