# typed: strong

module Trycourier
  module Models
    class MessageRouting < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::MessageRouting, Trycourier::Internal::AnyHash)
        end

      sig { returns(T::Array[Trycourier::MessageRoutingChannel]) }
      attr_accessor :channels

      sig { returns(Trycourier::MessageRouting::Method::OrSymbol) }
      attr_accessor :method_

      sig do
        params(
          channels: T::Array[Trycourier::MessageRoutingChannel],
          method_: Trycourier::MessageRouting::Method::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(channels:, method_:)
      end

      sig do
        override.returns(
          {
            channels: T::Array[Trycourier::MessageRoutingChannel],
            method_: Trycourier::MessageRouting::Method::OrSymbol
          }
        )
      end
      def to_hash
      end

      module Method
        extend Trycourier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Trycourier::MessageRouting::Method) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ALL = T.let(:all, Trycourier::MessageRouting::Method::TaggedSymbol)
        SINGLE =
          T.let(:single, Trycourier::MessageRouting::Method::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Trycourier::MessageRouting::Method::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
