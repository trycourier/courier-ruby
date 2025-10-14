# typed: strong

module Trycourier
  module Models
    class BrandColors < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::BrandColors, Trycourier::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_reader :primary

      sig { params(primary: String).void }
      attr_writer :primary

      sig { returns(T.nilable(String)) }
      attr_reader :secondary

      sig { params(secondary: String).void }
      attr_writer :secondary

      sig do
        params(primary: String, secondary: String).returns(T.attached_class)
      end
      def self.new(primary: nil, secondary: nil)
      end

      sig { override.returns({ primary: String, secondary: String }) }
      def to_hash
      end
    end
  end
end
