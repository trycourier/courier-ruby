# typed: strong

module Courier
  module Models
    class WidgetBackground < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::WidgetBackground, Courier::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_accessor :bottom_color

      sig { returns(T.nilable(String)) }
      attr_accessor :top_color

      sig do
        params(
          bottom_color: T.nilable(String),
          top_color: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(bottom_color: nil, top_color: nil)
      end

      sig do
        override.returns(
          { bottom_color: T.nilable(String), top_color: T.nilable(String) }
        )
      end
      def to_hash
      end
    end
  end
end
