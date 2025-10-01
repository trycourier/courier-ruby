# frozen_string_literal: true

module Courier
  module Resources
    class Tenants
      class DefaultPreferences
        # @return [Courier::Resources::Tenants::DefaultPreferences::Items]
        attr_reader :items

        # @api private
        #
        # @param client [Courier::Client]
        def initialize(client:)
          @client = client
          @items = Courier::Resources::Tenants::DefaultPreferences::Items.new(client: client)
        end
      end
    end
  end
end
