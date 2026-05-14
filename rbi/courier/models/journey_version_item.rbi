# typed: strong

module Courier
  module Models
    class JourneyVersionItem < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::JourneyVersionItem, Courier::Internal::AnyHash)
        end

      sig { returns(T.nilable(Integer)) }
      attr_accessor :created

      sig { returns(T.nilable(String)) }
      attr_accessor :creator

      sig { returns(String) }
      attr_accessor :name

      sig { returns(T.nilable(Integer)) }
      attr_accessor :published

      sig { returns(String) }
      attr_accessor :version

      sig do
        params(
          created: T.nilable(Integer),
          creator: T.nilable(String),
          name: String,
          published: T.nilable(Integer),
          version: String
        ).returns(T.attached_class)
      end
      def self.new(created:, creator:, name:, published:, version:)
      end

      sig do
        override.returns(
          {
            created: T.nilable(Integer),
            creator: T.nilable(String),
            name: String,
            published: T.nilable(Integer),
            version: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
