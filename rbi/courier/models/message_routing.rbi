# typed: strong

module Courier
  module Models
    class MessageRouting < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::MessageRouting, Courier::Internal::AnyHash)
        end

      sig { returns(T::Array[Courier::MessageRoutingChannel]) }
      attr_accessor :channels

      sig { returns(Courier::MessageRouting::Method::OrSymbol) }
      attr_accessor :method_

      sig do
        params(
          channels: T::Array[Courier::MessageRoutingChannel],
          method_: Courier::MessageRouting::Method::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(channels:, method_:)
      end

      sig do
        override.returns(
          {
            channels: T::Array[Courier::MessageRoutingChannel],
            method_: Courier::MessageRouting::Method::OrSymbol
          }
        )
      end
      def to_hash
      end

      module Method
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Courier::MessageRouting::Method) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ALL = T.let(:all, Courier::MessageRouting::Method::TaggedSymbol)
        SINGLE = T.let(:single, Courier::MessageRouting::Method::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Courier::MessageRouting::Method::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
