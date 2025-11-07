# frozen_string_literal: true

module Trycourier
  module Resources
    class Tenants
      class Preferences
        # @return [Trycourier::Resources::Tenants::Preferences::Items]
        attr_reader :items

        # @api private
        #
        # @param client [Trycourier::Client]
        def initialize(client:)
          @client = client
          @items = Trycourier::Resources::Tenants::Preferences::Items.new(client: client)
        end
      end
    end
  end
end
