# typed: strong

module Courier
  module Resources
    class Automations
      class Invoke
        # @api private
        sig { params(client: Courier::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
