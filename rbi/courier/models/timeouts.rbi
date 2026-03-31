# typed: strong

module Courier
  module Models
    class Timeouts < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Courier::Timeouts, Courier::Internal::AnyHash) }

      sig { returns(T.nilable(Integer)) }
      attr_accessor :channel

      sig { returns(T.nilable(Integer)) }
      attr_accessor :provider

      sig do
        params(
          channel: T.nilable(Integer),
          provider: T.nilable(Integer)
        ).returns(T.attached_class)
      end
      def self.new(channel: nil, provider: nil)
      end

      sig do
        override.returns(
          { channel: T.nilable(Integer), provider: T.nilable(Integer) }
        )
      end
      def to_hash
      end
    end
  end
end
