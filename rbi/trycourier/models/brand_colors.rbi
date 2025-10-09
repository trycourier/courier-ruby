# typed: strong

module Trycourier
  module Models
    class BrandColors < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::BrandColors, Trycourier::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_accessor :primary

      sig { returns(T.nilable(String)) }
      attr_accessor :secondary

      sig do
        params(
          primary: T.nilable(String),
          secondary: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(primary: nil, secondary: nil)
      end

      sig do
        override.returns(
          { primary: T.nilable(String), secondary: T.nilable(String) }
        )
      end
      def to_hash
      end
    end
  end
end
