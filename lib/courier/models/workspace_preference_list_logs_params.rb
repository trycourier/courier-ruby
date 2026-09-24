# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::WorkspacePreferences#list_logs
    class WorkspacePreferenceListLogsParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute cursor
      #   A cursor from a previous response's paging.cursor. Continue only while
      #   paging.more is true; the cursor is omitted on the last page.
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute limit
      #   How many entries to return. Defaults to 25.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute since
      #   Return only changes at or after this time, as an ISO-8601 date or date-time. A
      #   date alone is read as the start of that day in UTC.
      #
      #   @return [String, nil]
      optional :since, String

      # @!attribute tenant_id
      #   Narrow to the changes this user made in one tenant context. Only valid together
      #   with user_id.
      #
      #   @return [String, nil]
      optional :tenant_id, String

      # @!attribute user_id
      #   Return only this user's changes. Omit it to read every change in the
      #   environment.
      #
      #   @return [String, nil]
      optional :user_id, String

      # @!method initialize(cursor: nil, limit: nil, since: nil, tenant_id: nil, user_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::WorkspacePreferenceListLogsParams} for more details.
      #
      #   @param cursor [String] A cursor from a previous response's paging.cursor. Continue only while paging.mo
      #
      #   @param limit [Integer] How many entries to return. Defaults to 25.
      #
      #   @param since [String] Return only changes at or after this time, as an ISO-8601 date or date-time. A d
      #
      #   @param tenant_id [String] Narrow to the changes this user made in one tenant context. Only valid together
      #
      #   @param user_id [String] Return only this user's changes. Omit it to read every change in the environment
      #
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
