# typed: strong

module Courier
  module Resources
    class Tenants
      class DefaultPreferences
        sig { returns(Courier::Resources::Tenants::DefaultPreferences::Items) }
        attr_reader :items

        # @api private
        sig { params(client: Courier::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
