# typed: strong

module Courier
  module Resources
    class Digests
      sig { returns(Courier::Resources::Digests::Schedules) }
      attr_reader :schedules

      # @api private
      sig { params(client: Courier::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
