# typed: strong

module Trycourier
  module Models
    class EmailHeader < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::EmailHeader, Trycourier::Internal::AnyHash)
        end

      sig { returns(Trycourier::Logo) }
      attr_reader :logo

      sig { params(logo: Trycourier::Logo::OrHash).void }
      attr_writer :logo

      sig { returns(T.nilable(String)) }
      attr_accessor :bar_color

      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :inherit_default

      sig do
        params(
          logo: Trycourier::Logo::OrHash,
          bar_color: T.nilable(String),
          inherit_default: T.nilable(T::Boolean)
        ).returns(T.attached_class)
      end
      def self.new(logo:, bar_color: nil, inherit_default: nil)
      end

      sig do
        override.returns(
          {
            logo: Trycourier::Logo,
            bar_color: T.nilable(String),
            inherit_default: T.nilable(T::Boolean)
          }
        )
      end
      def to_hash
      end
    end
  end
end
