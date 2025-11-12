# typed: strong

module Trycourier
  module Models
    class UserRecipient < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::UserRecipient, Trycourier::Internal::AnyHash)
        end

      # Deprecated - Use `tenant_id` instead.
      sig { returns(T.nilable(String)) }
      attr_accessor :account_id

      # Context such as tenant_id to send the notification with.
      sig { returns(T.nilable(Trycourier::MessageContext)) }
      attr_reader :context

      sig do
        params(context: T.nilable(Trycourier::MessageContext::OrHash)).void
      end
      attr_writer :context

      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_accessor :data

      # The user's email address.
      sig { returns(T.nilable(String)) }
      attr_accessor :email

      # The id of the list to send the message to.
      sig { returns(T.nilable(String)) }
      attr_accessor :list_id

      # The user's preferred ISO 639-1 language code.
      sig { returns(T.nilable(String)) }
      attr_accessor :locale

      # The user's phone number.
      sig { returns(T.nilable(String)) }
      attr_accessor :phone_number

      sig { returns(T.nilable(Trycourier::UserRecipient::Preferences)) }
      attr_reader :preferences

      sig do
        params(
          preferences: T.nilable(Trycourier::UserRecipient::Preferences::OrHash)
        ).void
      end
      attr_writer :preferences

      # The id of the tenant the user is associated with.
      sig { returns(T.nilable(String)) }
      attr_accessor :tenant_id

      # The user's unique identifier. Typically, this will match the user id of a user
      # in your system.
      sig { returns(T.nilable(String)) }
      attr_accessor :user_id

      sig do
        params(
          account_id: T.nilable(String),
          context: T.nilable(Trycourier::MessageContext::OrHash),
          data: T.nilable(T::Hash[Symbol, T.anything]),
          email: T.nilable(String),
          list_id: T.nilable(String),
          locale: T.nilable(String),
          phone_number: T.nilable(String),
          preferences:
            T.nilable(Trycourier::UserRecipient::Preferences::OrHash),
          tenant_id: T.nilable(String),
          user_id: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Deprecated - Use `tenant_id` instead.
        account_id: nil,
        # Context such as tenant_id to send the notification with.
        context: nil,
        data: nil,
        # The user's email address.
        email: nil,
        # The id of the list to send the message to.
        list_id: nil,
        # The user's preferred ISO 639-1 language code.
        locale: nil,
        # The user's phone number.
        phone_number: nil,
        preferences: nil,
        # The id of the tenant the user is associated with.
        tenant_id: nil,
        # The user's unique identifier. Typically, this will match the user id of a user
        # in your system.
        user_id: nil
      )
      end

      sig do
        override.returns(
          {
            account_id: T.nilable(String),
            context: T.nilable(Trycourier::MessageContext),
            data: T.nilable(T::Hash[Symbol, T.anything]),
            email: T.nilable(String),
            list_id: T.nilable(String),
            locale: T.nilable(String),
            phone_number: T.nilable(String),
            preferences: T.nilable(Trycourier::UserRecipient::Preferences),
            tenant_id: T.nilable(String),
            user_id: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      class Preferences < Trycourier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Trycourier::UserRecipient::Preferences,
              Trycourier::Internal::AnyHash
            )
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
end
