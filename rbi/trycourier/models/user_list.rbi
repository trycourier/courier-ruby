# typed: strong

module Trycourier
  module Models
    class UserList < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::UserList, Trycourier::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(String) }
      attr_accessor :name

      sig { returns(T.nilable(String)) }
      attr_accessor :created

      sig { returns(T.nilable(String)) }
      attr_accessor :updated

      sig do
        params(
          id: String,
          name: String,
          created: T.nilable(String),
          updated: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(id:, name:, created: nil, updated: nil)
      end

      sig do
        override.returns(
          {
            id: String,
            name: String,
            created: T.nilable(String),
            updated: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
