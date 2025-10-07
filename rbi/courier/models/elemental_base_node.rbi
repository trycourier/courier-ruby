# typed: strong

module Courier
  module Models
    class ElementalBaseNode < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::ElementalBaseNode, Courier::Internal::AnyHash)
        end

      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :channels

      sig { returns(T.nilable(String)) }
      attr_accessor :if_

      sig { returns(T.nilable(String)) }
      attr_accessor :loop_

      sig { returns(T.nilable(String)) }
      attr_accessor :ref

      sig do
        params(
          channels: T.nilable(T::Array[String]),
          if_: T.nilable(String),
          loop_: T.nilable(String),
          ref: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(channels: nil, if_: nil, loop_: nil, ref: nil)
      end

      sig do
        override.returns(
          {
            channels: T.nilable(T::Array[String]),
            if_: T.nilable(String),
            loop_: T.nilable(String),
            ref: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
