# typed: strong

module Courier
  module Models
    class JourneyPublishRequest < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::JourneyPublishRequest, Courier::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_reader :version

      sig { params(version: String).void }
      attr_writer :version

      sig { params(version: String).returns(T.attached_class) }
      def self.new(version: nil)
      end

      sig { override.returns({ version: String }) }
      def to_hash
      end
    end
  end
end
