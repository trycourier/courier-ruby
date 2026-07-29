# typed: strong

module Courier
  module Resources
    class Tenants
      class Preferences
        # Manage tenants — the organizations, teams, or accounts your users belong to —
        # along with their users and default preferences.
        sig { returns(Courier::Resources::Tenants::Preferences::Items) }
        attr_reader :items

        # @api private
        sig { params(client: Courier::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
