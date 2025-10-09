# typed: strong

module Trycourier
  module Resources
    class Automations
      sig { returns(Trycourier::Resources::Automations::Invoke) }
      attr_reader :invoke

      # @api private
      sig { params(client: Trycourier::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
