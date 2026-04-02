# typed: strong

module Courier
  module Models
    class ProviderListParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Courier::ProviderListParams, Courier::Internal::AnyHash)
        end

      # Opaque cursor for fetching the next page.
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      sig do
        params(
          cursor: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Opaque cursor for fetching the next page.
        cursor: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { cursor: String, request_options: Courier::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
