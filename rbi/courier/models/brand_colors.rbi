# typed: strong

module Courier
  module Models
    class BrandColors < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Courier::BrandColors, Courier::Internal::AnyHash) }

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
