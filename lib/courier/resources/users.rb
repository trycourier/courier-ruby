# frozen_string_literal: true

module Courier
  module Resources
    class Users
      # @return [Courier::Resources::Users::Preferences]
      attr_reader :preferences

      # @return [Courier::Resources::Users::Tenants]
      attr_reader :tenants

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
