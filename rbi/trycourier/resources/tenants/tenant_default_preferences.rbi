# typed: strong

module Trycourier
  module Resources
    class Tenants
      class TenantDefaultPreferences
        sig do
          returns(
            Trycourier::Resources::Tenants::TenantDefaultPreferences::Items
          )
        end
        attr_reader :items

        # @api private
        sig { params(client: Trycourier::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
