# typed: strong

module Courier
  module Models
    class List < Courier::Internal::Type::BaseModel
      OrHash = T.type_alias { T.any(Courier::List, Courier::Internal::AnyHash) }

      sig { returns(String) }
      attr_accessor :id

      sig { returns(String) }
      attr_accessor :name

      sig { returns(T.nilable(Integer)) }
      attr_accessor :created

      sig { returns(T.nilable(Integer)) }
      attr_accessor :updated

      sig do
        params(
          id: String,
          name: String,
          created: T.nilable(Integer),
          updated: T.nilable(Integer)
        ).returns(T.attached_class)
      end
      def self.new(id:, name:, created: nil, updated: nil)
      end

      sig do
        override.returns(
          {
            id: String,
            name: String,
            created: T.nilable(Integer),
            updated: T.nilable(Integer)
          }
        )
      end
      def to_hash
      end
    end
  end
end
