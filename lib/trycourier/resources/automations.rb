# frozen_string_literal: true

module Trycourier
  module Resources
    class Automations
      # @return [Trycourier::Resources::Automations::Invoke]
      attr_reader :invoke

      # @api private
      #
      # @param client [Trycourier::Client]
      def initialize(client:)
        @client = client
        @invoke = Trycourier::Resources::Automations::Invoke.new(client: client)
      end
    end
  end
end
