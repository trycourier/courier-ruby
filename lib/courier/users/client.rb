# frozen_string_literal: true

module Courier
  module Users
    class Client
      # @return [Courier::Users::Client]
      def initialize(client:)
        @client = client
      end

      # @return [Courier::Preferences::Client]
      def preferences
        @preferences ||= Courier::Users::Preferences::Client.new(client: @client)
      end

      # @return [Courier::Tenants::Client]
      def tenants
        @tenants ||= Courier::Users::Tenants::Client.new(client: @client)
      end

      # @return [Courier::Tokens::Client]
      def tokens
        @tokens ||= Courier::Users::Tokens::Client.new(client: @client)
      end
    end
  end
end
