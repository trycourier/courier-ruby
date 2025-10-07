# typed: strong

module Courier
  module Models
    class Rule < Courier::Internal::Type::BaseModel
      OrHash = T.type_alias { T.any(Courier::Rule, Courier::Internal::AnyHash) }

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
