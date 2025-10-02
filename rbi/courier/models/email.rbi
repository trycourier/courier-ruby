# typed: strong

module Courier
  module Models
    class Email < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Courier::Email, Courier::Internal::AnyHash) }

      sig { returns(T.anything) }
      attr_accessor :footer

      sig { returns(T.anything) }
      attr_accessor :header

      sig do
        params(footer: T.anything, header: T.anything).returns(T.attached_class)
      end
      def self.new(footer:, header:)
      end

      sig { override.returns({ footer: T.anything, header: T.anything }) }
      def to_hash
      end
    end
  end
end
