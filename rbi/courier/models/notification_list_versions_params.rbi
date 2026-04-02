# typed: strong

module Courier
  module Models
    class NotificationListVersionsParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Courier::NotificationListVersionsParams,
            Courier::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      # Opaque pagination cursor from a previous response. Omit for the first page.
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # Maximum number of versions to return per page. Default 10, max 10.
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      sig do
        params(
          id: String,
          cursor: String,
          limit: Integer,
          request_options: Courier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        # Opaque pagination cursor from a previous response. Omit for the first page.
        cursor: nil,
        # Maximum number of versions to return per page. Default 10, max 10.
        limit: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            id: String,
            cursor: String,
            limit: Integer,
            request_options: Courier::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
