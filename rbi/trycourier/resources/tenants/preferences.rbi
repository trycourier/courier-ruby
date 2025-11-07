# typed: strong

module Trycourier
  module Resources
    class Tenants
      class Preferences
        sig { returns(Trycourier::Resources::Tenants::Preferences::Items) }
        attr_reader :items

        # @api private
        sig { params(client: Trycourier::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
