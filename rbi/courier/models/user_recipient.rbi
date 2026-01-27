# typed: strong

module Courier
  module Models
    class UserRecipient < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::UserRecipient, Courier::Internal::AnyHash)
        end

      # Deprecated - Use `tenant_id` instead.
      sig { returns(T.nilable(String)) }
      attr_accessor :account_id

      # Context such as tenant_id to send the notification with.
      sig { returns(T.nilable(Courier::MessageContext)) }
      attr_reader :context

      sig { params(context: T.nilable(Courier::MessageContext::OrHash)).void }
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

      sig { returns(T.nilable(Courier::UserRecipient::Preferences)) }
      attr_reader :preferences

      sig do
        params(
          preferences: T.nilable(Courier::UserRecipient::Preferences::OrHash)
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
          context: T.nilable(Courier::MessageContext::OrHash),
          data: T.nilable(T::Hash[Symbol, T.anything]),
          email: T.nilable(String),
          list_id: T.nilable(String),
          locale: T.nilable(String),
          phone_number: T.nilable(String),
          preferences: T.nilable(Courier::UserRecipient::Preferences::OrHash),
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
            context: T.nilable(Courier::MessageContext),
            data: T.nilable(T::Hash[Symbol, T.anything]),
            email: T.nilable(String),
            list_id: T.nilable(String),
            locale: T.nilable(String),
            phone_number: T.nilable(String),
            preferences: T.nilable(Courier::UserRecipient::Preferences),
            tenant_id: T.nilable(String),
            user_id: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      class Preferences < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::UserRecipient::Preferences,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(T::Hash[Symbol, Courier::Preference]) }
        attr_accessor :notifications

        sig { returns(T.nilable(T::Hash[Symbol, Courier::Preference])) }
        attr_accessor :categories

        sig { returns(T.nilable(String)) }
        attr_accessor :template_id

        sig do
          params(
            notifications: T::Hash[Symbol, Courier::Preference::OrHash],
            categories: T.nilable(T::Hash[Symbol, Courier::Preference::OrHash]),
            template_id: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(notifications:, categories: nil, template_id: nil)
        end

        sig do
          override.returns(
            {
              notifications: T::Hash[Symbol, Courier::Preference],
              categories: T.nilable(T::Hash[Symbol, Courier::Preference]),
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
