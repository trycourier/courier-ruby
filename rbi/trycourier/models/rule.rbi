# typed: strong

module Trycourier
  module Models
    class Rule < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Trycourier::Rule, Trycourier::Internal::AnyHash) }

      sig { returns(String) }
      attr_accessor :until_

      sig { returns(T.nilable(String)) }
      attr_accessor :start

      sig do
        params(until_: String, start: T.nilable(String)).returns(
          T.attached_class
        )
      end
      def self.new(until_:, start: nil)
      end

      sig { override.returns({ until_: String, start: T.nilable(String) }) }
      def to_hash
      end
    end
  end
end
