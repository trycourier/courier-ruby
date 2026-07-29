# typed: strong

module Courier
  module Models
    class UpdateBroadcastRequest < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::UpdateBroadcastRequest, Courier::Internal::AnyHash)
        end

      # New human-readable name.
      sig { returns(String) }
      attr_accessor :name

      # Request body for updating a broadcast. Only the name is mutable.
      sig { params(name: String).returns(T.attached_class) }
      def self.new(
        # New human-readable name.
        name:
      )
      end

      sig { override.returns({ name: String }) }
      def to_hash
      end
    end
  end
end
