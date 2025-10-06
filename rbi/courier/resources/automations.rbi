# typed: strong

module Courier
  module Resources
    class Automations
      sig { returns(Courier::Resources::Automations::Invoke) }
      attr_reader :invoke

      # @api private
      sig { params(client: Courier::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
