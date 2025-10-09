# typed: strong

module Trycourier
  module Models
    class BrandSnippet < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::BrandSnippet, Trycourier::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :name

      sig { returns(String) }
      attr_accessor :value

      sig { params(name: String, value: String).returns(T.attached_class) }
      def self.new(name:, value:)
      end

      sig { override.returns({ name: String, value: String }) }
      def to_hash
      end
    end
  end
end
