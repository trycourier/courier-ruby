# typed: strong

module Courier
  module Models
    class Logo < Courier::Internal::Type::BaseModel
      OrHash = T.type_alias { T.any(Courier::Logo, Courier::Internal::AnyHash) }

      sig { returns(T.nilable(String)) }
      attr_accessor :href

      sig { returns(T.nilable(String)) }
      attr_accessor :image

      sig do
        params(href: T.nilable(String), image: T.nilable(String)).returns(
          T.attached_class
        )
      end
      def self.new(href: nil, image: nil)
      end

      sig do
        override.returns({ href: T.nilable(String), image: T.nilable(String) })
      end
      def to_hash
      end
    end
  end
end
