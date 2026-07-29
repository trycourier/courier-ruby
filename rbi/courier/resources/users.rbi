# typed: strong

module Courier
  module Resources
    class Users
      # Read and write a single user's notification preferences, per topic and per
      # channel.
      sig { returns(Courier::Resources::Users::Preferences) }
      attr_reader :preferences

      # Associate a user with one or more tenants, and read or remove those
      # associations.
      sig { returns(Courier::Resources::Users::Tenants) }
      attr_reader :tenants

      # Register and manage the APNS and FCM device tokens Courier delivers push
      # notifications to.
      sig { returns(Courier::Resources::Users::Tokens) }
      attr_reader :tokens

      # @api private
      sig { params(client: Courier::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
