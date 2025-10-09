# typed: strong

module Trycourier
  module Models
    class DefaultPreferences < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::DefaultPreferences, Trycourier::Internal::AnyHash)
        end

      sig { returns(T.nilable(T::Array[Trycourier::DefaultPreferences::Item])) }
      attr_accessor :items

      sig do
        params(
          items:
            T.nilable(T::Array[Trycourier::DefaultPreferences::Item::OrHash])
        ).returns(T.attached_class)
      end
      def self.new(items: nil)
      end

      sig do
        override.returns(
          { items: T.nilable(T::Array[Trycourier::DefaultPreferences::Item]) }
        )
      end
      def to_hash
      end

      class Item < Trycourier::Models::SubscriptionTopicNew
        OrHash =
          T.type_alias do
            T.any(
              Trycourier::DefaultPreferences::Item,
              Trycourier::Internal::AnyHash
            )
          end

        # Topic ID
        sig { returns(String) }
        attr_accessor :id

        sig { params(id: String).returns(T.attached_class) }
        def self.new(
          # Topic ID
          id:
        )
        end

        sig { override.returns({ id: String }) }
        def to_hash
        end
      end
    end
  end
end
