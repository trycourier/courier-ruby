# frozen_string_literal: true

module Courier
  module Resources
    class Automations
      class Invoke
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
