# frozen_string_literal: true

require_relative "../../requests"
require_relative "preferences/client"
require_relative "tenants/client"
require_relative "tokens/client"

module Courier
  module Users
    class Client
      attr_reader :preferences, :tenants, :tokens

      # @param request_client [RequestClient]
      # @return [Users::Client]
      def initialize(request_client:)
        @preferences = Users::PreferencesClient.new(request_client: request_client)
        @tenants = Users::TenantsClient.new(request_client: request_client)
        @tokens = Users::TokensClient.new(request_client: request_client)
      end
    end

    class AsyncClient
      attr_reader :preferences, :tenants, :tokens

      # @param request_client [RequestClient]
      # @return [Users::AsyncClient]
      def initialize(request_client:)
        @preferences = Users::AsyncPreferencesClient.new(request_client: request_client)
        @tenants = Users::AsyncTenantsClient.new(request_client: request_client)
        @tokens = Users::AsyncTokensClient.new(request_client: request_client)
      end
    end
  end
end
