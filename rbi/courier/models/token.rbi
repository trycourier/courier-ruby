# typed: strong

module Courier
  module Models
    class Token < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Courier::Token, Courier::Internal::AnyHash) }

      sig { returns(String) }
      attr_accessor :token

      sig { params(token: String).returns(T.attached_class) }
      def self.new(token:)
      end

      sig { override.returns({ token: String }) }
      def to_hash
      end
    end
  end
end
