# frozen_string_literal: true

module Trycourier
  module Resources
    class Users
      # @return [Trycourier::Resources::Users::Preferences]
      attr_reader :preferences

      # @return [Trycourier::Resources::Users::Tenants]
      attr_reader :tenants

      # @return [Trycourier::Resources::Users::Tokens]
      attr_reader :tokens

      # @api private
      #
      # @param client [Trycourier::Client]
      def initialize(client:)
        @client = client
        @preferences = Trycourier::Resources::Users::Preferences.new(client: client)
        @tenants = Trycourier::Resources::Users::Tenants.new(client: client)
        @tokens = Trycourier::Resources::Users::Tokens.new(client: client)
      end
    end
  end
end
