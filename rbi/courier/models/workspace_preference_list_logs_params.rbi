# typed: strong

module Courier
  module Models
    class WorkspacePreferenceListLogsParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Courier::WorkspacePreferenceListLogsParams,
            Courier::Internal::AnyHash
          )
        end

      # A cursor from a previous response's paging.cursor. Continue only while
      # paging.more is true; the cursor is omitted on the last page.
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # How many entries to return. Defaults to 25.
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Return only changes at or after this time, as an ISO-8601 date or date-time. A
      # date alone is read as the start of that day in UTC.
      sig { returns(T.nilable(String)) }
      attr_reader :since

      sig { params(since: String).void }
      attr_writer :since

      # Narrow to the changes this user made in one tenant context. Only valid together
      # with user_id.
      sig { returns(T.nilable(String)) }
      attr_reader :tenant_id

      sig { params(tenant_id: String).void }
      attr_writer :tenant_id

      # Return only this user's changes. Omit it to read every change in the
      # environment.
      sig { returns(T.nilable(String)) }
      attr_reader :user_id

      sig { params(user_id: String).void }
      attr_writer :user_id

      sig do
        params(
          cursor: String,
          limit: Integer,
          since: String,
          tenant_id: String,
          user_id: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # A cursor from a previous response's paging.cursor. Continue only while
        # paging.more is true; the cursor is omitted on the last page.
        cursor: nil,
        # How many entries to return. Defaults to 25.
        limit: nil,
        # Return only changes at or after this time, as an ISO-8601 date or date-time. A
        # date alone is read as the start of that day in UTC.
        since: nil,
        # Narrow to the changes this user made in one tenant context. Only valid together
        # with user_id.
        tenant_id: nil,
        # Return only this user's changes. Omit it to read every change in the
        # environment.
        user_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            cursor: String,
            limit: Integer,
            since: String,
            tenant_id: String,
            user_id: String,
            request_options: Courier::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
