# typed: strong

module Courier
  module Models
    class Icons < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Courier::Icons, Courier::Internal::AnyHash) }

      sig { returns(T.nilable(String)) }
      attr_accessor :bell

      sig { returns(T.nilable(String)) }
      attr_accessor :message

      sig do
        params(bell: T.nilable(String), message: T.nilable(String)).returns(
          T.attached_class
        )
      end
      def self.new(bell: nil, message: nil)
      end

      sig do
        override.returns(
          { bell: T.nilable(String), message: T.nilable(String) }
        )
      end
      def to_hash
      end
    end
  end
end
