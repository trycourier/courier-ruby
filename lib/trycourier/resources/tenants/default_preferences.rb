# frozen_string_literal: true

module Trycourier
  module Resources
    class Tenants
      class DefaultPreferences
        # @return [Trycourier::Resources::Tenants::DefaultPreferences::Items]
        attr_reader :items

        # @api private
        #
        # @param client [Trycourier::Client]
        def initialize(client:)
          @client = client
          @items = Trycourier::Resources::Tenants::DefaultPreferences::Items.new(client: client)
        end
      end
    end
  end
end
