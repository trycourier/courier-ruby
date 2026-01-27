# typed: strong

module Courier
  module Models
    class SendToChannel < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::SendToChannel, Courier::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :channel_id

      sig { params(channel_id: String).returns(T.attached_class) }
      def self.new(channel_id:)
      end

      sig { override.returns({ channel_id: String }) }
      def to_hash
      end
    end
  end
end
