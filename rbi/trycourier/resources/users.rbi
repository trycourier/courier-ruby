# typed: strong

module Trycourier
  module Resources
    class Users
      sig { returns(Trycourier::Resources::Users::Preferences) }
      attr_reader :preferences

      sig { returns(Trycourier::Resources::Users::Tenants) }
      attr_reader :tenants

      sig { returns(Trycourier::Resources::Users::Tokens) }
      attr_reader :tokens

      # @api private
      sig { params(client: Trycourier::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
