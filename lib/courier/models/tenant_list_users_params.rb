# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Tenants#list_users
    class TenantListUsersParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute cursor
      #   Continue the pagination with the next cursor
      #
      #   @return [String, nil]
      optional :cursor, String, nil?: true

      # @!attribute limit
      #   The number of accounts to return (defaults to 20, maximum value of 100)
      #
      #   @return [Integer, nil]
      optional :limit, Integer, nil?: true

      # @!method initialize(cursor: nil, limit: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::TenantListUsersParams} for more details.
      #
      #   @param cursor [String, nil] Continue the pagination with the next cursor
      #
      #   @param limit [Integer, nil] The number of accounts to return
      #
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
