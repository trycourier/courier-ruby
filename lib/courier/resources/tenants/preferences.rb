# frozen_string_literal: true

module Courier
  module Resources
    class Tenants
      class Preferences
        # Manage tenants — the organizations, teams, or accounts your users belong to —
        # along with their users and default preferences.
        # @return [Courier::Resources::Tenants::Preferences::Items]
        attr_reader :items

        # @api private
        #
        # @param client [Courier::Client]
        def initialize(client:)
          @client = client
          @items = Courier::Resources::Tenants::Preferences::Items.new(client: client)
        end
      end
    end
  end
end
