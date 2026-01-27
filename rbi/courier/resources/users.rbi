# typed: strong

module Courier
  module Resources
    class Users
      sig { returns(Courier::Resources::Users::Preferences) }
      attr_reader :preferences

      sig { returns(Courier::Resources::Users::Tenants) }
      attr_reader :tenants

      sig { returns(Courier::Resources::Users::Tokens) }
      attr_reader :tokens

      # @api private
      sig { params(client: Courier::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
