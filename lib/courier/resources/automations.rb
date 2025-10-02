# frozen_string_literal: true

module Courier
  module Resources
    class Automations
      # @return [Courier::Resources::Automations::Invoke]
      attr_reader :invoke

      # @api private
      #
      # @param client [Courier::Client]
      def initialize(client:)
        @client = client
        @invoke = Courier::Resources::Automations::Invoke.new(client: client)
      end
    end
  end
end
