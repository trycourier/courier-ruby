# typed: strong

module Trycourier
  module Models
    class Token < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Trycourier::Token, Trycourier::Internal::AnyHash) }

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
