# typed: strong

module Trycourier
  module Models
    class ProfilePreferences < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::ProfilePreferences, Trycourier::Internal::AnyHash)
        end

      sig { returns(T::Hash[Symbol, Trycourier::Preference]) }
      attr_accessor :notifications

      sig { returns(T.nilable(T::Hash[Symbol, Trycourier::Preference])) }
      attr_accessor :categories

      sig { returns(T.nilable(String)) }
      attr_accessor :template_id

      sig do
        params(
          notifications: T::Hash[Symbol, Trycourier::Preference::OrHash],
          categories:
            T.nilable(T::Hash[Symbol, Trycourier::Preference::OrHash]),
          template_id: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(notifications:, categories: nil, template_id: nil)
      end

      sig do
        override.returns(
          {
            notifications: T::Hash[Symbol, Trycourier::Preference],
            categories: T.nilable(T::Hash[Symbol, Trycourier::Preference]),
            template_id: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
