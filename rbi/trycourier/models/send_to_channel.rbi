# typed: strong

module Trycourier
  module Models
    class SendToChannel < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::SendToChannel, Trycourier::Internal::AnyHash)
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
