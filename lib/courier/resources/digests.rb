# frozen_string_literal: true

module Courier
  module Resources
    class Digests
      # Inspect what has accumulated in a digest schedule and release a digest ahead of
      # its next scheduled delivery.
      # @return [Courier::Resources::Digests::Schedules]
      attr_reader :schedules

      # @api private
      #
      # @param client [Courier::Client]
      def initialize(client:)
        @client = client
        @schedules = Courier::Resources::Digests::Schedules.new(client: client)
      end
    end
  end
end
