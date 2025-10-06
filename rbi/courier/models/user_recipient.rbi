# typed: strong

module Courier
  module Models
    class UserRecipient < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::UserRecipient, Courier::Internal::AnyHash)
        end

      # Use `tenant_id` instead.
      sig { returns(T.nilable(String)) }
      attr_accessor :account_id

      # Context such as tenant_id to send the notification with.
      sig { returns(T.nilable(Courier::MessageContext)) }
      attr_reader :context

      sig { params(context: T.nilable(Courier::MessageContext::OrHash)).void }
      attr_writer :context

      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_accessor :data

      sig { returns(T.nilable(String)) }
      attr_accessor :email

      # The user's preferred ISO 639-1 language code.
      sig { returns(T.nilable(String)) }
      attr_accessor :locale

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

      # Tenant id. Will load brand, default preferences and base context data.
      sig { returns(T.nilable(String)) }
      attr_accessor :tenant_id

      sig { returns(T.nilable(String)) }
      attr_accessor :user_id

      sig do
        params(
          account_id: T.nilable(String),
          context: T.nilable(Courier::MessageContext::OrHash),
          data: T.nilable(T::Hash[Symbol, T.anything]),
          email: T.nilable(String),
          locale: T.nilable(String),
          phone_number: T.nilable(String),
          preferences: T.nilable(Courier::UserRecipient::Preferences::OrHash),
          tenant_id: T.nilable(String),
          user_id: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Use `tenant_id` instead.
        account_id: nil,
        # Context such as tenant_id to send the notification with.
        context: nil,
        data: nil,
        email: nil,
        # The user's preferred ISO 639-1 language code.
        locale: nil,
        phone_number: nil,
        preferences: nil,
        # Tenant id. Will load brand, default preferences and base context data.
        tenant_id: nil,
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
