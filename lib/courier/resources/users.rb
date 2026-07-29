# frozen_string_literal: true

module Courier
  module Resources
    class Users
      # Read and write a single user's notification preferences, per topic and per
      # channel.
      # @return [Courier::Resources::Users::Preferences]
      attr_reader :preferences

      # Associate a user with one or more tenants, and read or remove those
      # associations.
      # @return [Courier::Resources::Users::Tenants]
      attr_reader :tenants

      # Register and manage the APNS and FCM device tokens Courier delivers push
      # notifications to.
      # @return [Courier::Resources::Users::Tokens]
      attr_reader :tokens

      # @api private
      #
      # @param client [Courier::Client]
      def initialize(client:)
        @client = client
        @preferences = Courier::Resources::Users::Preferences.new(client: client)
        @tenants = Courier::Resources::Users::Tenants.new(client: client)
        @tokens = Courier::Resources::Users::Tokens.new(client: client)
      end
    end
  end
end
