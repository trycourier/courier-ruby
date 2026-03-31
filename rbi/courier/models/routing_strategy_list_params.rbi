# typed: strong

module Courier
  module Models
    class RoutingStrategyListParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Courier::RoutingStrategyListParams, Courier::Internal::AnyHash)
        end

      # Opaque pagination cursor from a previous response. Omit for the first page.
      sig { returns(T.nilable(String)) }
      attr_accessor :cursor

      # Maximum number of results per page. Default 20, max 100.
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      sig do
        params(
          cursor: T.nilable(String),
          limit: Integer,
          request_options: Courier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Opaque pagination cursor from a previous response. Omit for the first page.
        cursor: nil,
        # Maximum number of results per page. Default 20, max 100.
        limit: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            cursor: T.nilable(String),
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
