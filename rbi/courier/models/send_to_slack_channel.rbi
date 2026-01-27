# typed: strong

module Courier
  module Models
    class SendToSlackChannel < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::SendToSlackChannel, Courier::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :access_token

      sig { returns(String) }
      attr_accessor :channel

      sig do
        params(access_token: String, channel: String).returns(T.attached_class)
      end
      def self.new(access_token:, channel:)
      end

      sig { override.returns({ access_token: String, channel: String }) }
      def to_hash
      end
    end
  end
end
