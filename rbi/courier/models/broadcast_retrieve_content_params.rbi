# typed: strong

module Courier
  module Models
    class BroadcastRetrieveContentParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Courier::BroadcastRetrieveContentParams,
            Courier::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :broadcast_id

      # Accepts `draft`, `published`, or a version string (e.g. `v001`). Defaults to
      # `draft`.
      sig { returns(T.nilable(String)) }
      attr_reader :version

      sig { params(version: String).void }
      attr_writer :version

      sig do
        params(
          broadcast_id: String,
          version: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        broadcast_id:,
        # Accepts `draft`, `published`, or a version string (e.g. `v001`). Defaults to
        # `draft`.
        version: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            broadcast_id: String,
            version: String,
            request_options: Courier::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
