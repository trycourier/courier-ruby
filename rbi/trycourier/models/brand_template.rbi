# typed: strong

module Trycourier
  module Models
    class BrandTemplate < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::BrandTemplate, Trycourier::Internal::AnyHash)
        end

      sig { returns(T::Boolean) }
      attr_accessor :enabled

      sig { returns(T.nilable(String)) }
      attr_accessor :background_color

      sig { returns(T.nilable(String)) }
      attr_accessor :blocks_background_color

      sig { returns(T.nilable(String)) }
      attr_accessor :footer

      sig { returns(T.nilable(String)) }
      attr_accessor :head

      sig { returns(T.nilable(String)) }
      attr_accessor :header

      sig { returns(T.nilable(String)) }
      attr_accessor :width

      sig do
        params(
          enabled: T::Boolean,
          background_color: T.nilable(String),
          blocks_background_color: T.nilable(String),
          footer: T.nilable(String),
          head: T.nilable(String),
          header: T.nilable(String),
          width: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        enabled:,
        background_color: nil,
        blocks_background_color: nil,
        footer: nil,
        head: nil,
        header: nil,
        width: nil
      )
      end

      sig do
        override.returns(
          {
            enabled: T::Boolean,
            background_color: T.nilable(String),
            blocks_background_color: T.nilable(String),
            footer: T.nilable(String),
            head: T.nilable(String),
            header: T.nilable(String),
            width: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
