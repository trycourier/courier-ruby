# frozen_string_literal: true

module Courier
  module Resources
    class Notifications
      class Previews
        # Render a template's email content on real email clients and read back the
        # screenshots, so you can check how it looks before you send it.
        # @return [Courier::Resources::Notifications::Previews::Runs]
        attr_reader :runs

        # @api private
        #
        # @param client [Courier::Client]
        def initialize(client:)
          @client = client
          @runs = Courier::Resources::Notifications::Previews::Runs.new(client: client)
        end
      end
    end
  end
end
