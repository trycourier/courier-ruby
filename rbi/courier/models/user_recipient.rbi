# typed: strong

module Courier
  module Models
    class UserRecipient < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::UserRecipient, Courier::Internal::AnyHash)
        end

      # Use `tenant_id` instad.
      sig { returns(T.nilable(String)) }
      attr_accessor :account_id

      # Context information such as tenant_id to send the notification with.
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

      # An id of a tenant,
      # [see tenants api docs](https://www.courier.com/docs/reference/tenants). Will
      # load brand, default preferences and any other base context data associated with
      # this tenant.
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
        # Use `tenant_id` instad.
        account_id: nil,
        # Context information such as tenant_id to send the notification with.
        context: nil,
        data: nil,
        email: nil,
        # The user's preferred ISO 639-1 language code.
        locale: nil,
        phone_number: nil,
        preferences: nil,
        # An id of a tenant,
        # [see tenants api docs](https://www.courier.com/docs/reference/tenants). Will
        # load brand, default preferences and any other base context data associated with
        # this tenant.
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

        sig do
          returns(
            T::Hash[Symbol, Courier::UserRecipient::Preferences::Notification]
          )
        end
        attr_accessor :notifications

        sig do
          returns(
            T.nilable(
              T::Hash[Symbol, Courier::UserRecipient::Preferences::Category]
            )
          )
        end
        attr_accessor :categories

        sig { returns(T.nilable(String)) }
        attr_accessor :template_id

        sig do
          params(
            notifications:
              T::Hash[
                Symbol,
                Courier::UserRecipient::Preferences::Notification::OrHash
              ],
            categories:
              T.nilable(
                T::Hash[
                  Symbol,
                  Courier::UserRecipient::Preferences::Category::OrHash
                ]
              ),
            template_id: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(notifications:, categories: nil, template_id: nil)
        end

        sig do
          override.returns(
            {
              notifications:
                T::Hash[
                  Symbol,
                  Courier::UserRecipient::Preferences::Notification
                ],
              categories:
                T.nilable(
                  T::Hash[Symbol, Courier::UserRecipient::Preferences::Category]
                ),
              template_id: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        class Notification < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::UserRecipient::Preferences::Notification,
                Courier::Internal::AnyHash
              )
            end

          sig { returns(Courier::Users::PreferenceStatus::OrSymbol) }
          attr_accessor :status

          sig { returns(T.nilable(T::Array[Courier::ChannelPreference])) }
          attr_accessor :channel_preferences

          sig { returns(T.nilable(T::Array[Courier::Rule])) }
          attr_accessor :rules

          sig do
            returns(
              T.nilable(
                Courier::UserRecipient::Preferences::Notification::Source::OrSymbol
              )
            )
          end
          attr_accessor :source

          sig do
            params(
              status: Courier::Users::PreferenceStatus::OrSymbol,
              channel_preferences:
                T.nilable(T::Array[Courier::ChannelPreference::OrHash]),
              rules: T.nilable(T::Array[Courier::Rule::OrHash]),
              source:
                T.nilable(
                  Courier::UserRecipient::Preferences::Notification::Source::OrSymbol
                )
            ).returns(T.attached_class)
          end
          def self.new(
            status:,
            channel_preferences: nil,
            rules: nil,
            source: nil
          )
          end

          sig do
            override.returns(
              {
                status: Courier::Users::PreferenceStatus::OrSymbol,
                channel_preferences:
                  T.nilable(T::Array[Courier::ChannelPreference]),
                rules: T.nilable(T::Array[Courier::Rule]),
                source:
                  T.nilable(
                    Courier::UserRecipient::Preferences::Notification::Source::OrSymbol
                  )
              }
            )
          end
          def to_hash
          end

          module Source
            extend Courier::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Courier::UserRecipient::Preferences::Notification::Source
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SUBSCRIPTION =
              T.let(
                :subscription,
                Courier::UserRecipient::Preferences::Notification::Source::TaggedSymbol
              )
            LIST =
              T.let(
                :list,
                Courier::UserRecipient::Preferences::Notification::Source::TaggedSymbol
              )
            RECIPIENT =
              T.let(
                :recipient,
                Courier::UserRecipient::Preferences::Notification::Source::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Courier::UserRecipient::Preferences::Notification::Source::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class Category < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::UserRecipient::Preferences::Category,
                Courier::Internal::AnyHash
              )
            end

          sig { returns(Courier::Users::PreferenceStatus::OrSymbol) }
          attr_accessor :status

          sig { returns(T.nilable(T::Array[Courier::ChannelPreference])) }
          attr_accessor :channel_preferences

          sig { returns(T.nilable(T::Array[Courier::Rule])) }
          attr_accessor :rules

          sig do
            returns(
              T.nilable(
                Courier::UserRecipient::Preferences::Category::Source::OrSymbol
              )
            )
          end
          attr_accessor :source

          sig do
            params(
              status: Courier::Users::PreferenceStatus::OrSymbol,
              channel_preferences:
                T.nilable(T::Array[Courier::ChannelPreference::OrHash]),
              rules: T.nilable(T::Array[Courier::Rule::OrHash]),
              source:
                T.nilable(
                  Courier::UserRecipient::Preferences::Category::Source::OrSymbol
                )
            ).returns(T.attached_class)
          end
          def self.new(
            status:,
            channel_preferences: nil,
            rules: nil,
            source: nil
          )
          end

          sig do
            override.returns(
              {
                status: Courier::Users::PreferenceStatus::OrSymbol,
                channel_preferences:
                  T.nilable(T::Array[Courier::ChannelPreference]),
                rules: T.nilable(T::Array[Courier::Rule]),
                source:
                  T.nilable(
                    Courier::UserRecipient::Preferences::Category::Source::OrSymbol
                  )
              }
            )
          end
          def to_hash
          end

          module Source
            extend Courier::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Courier::UserRecipient::Preferences::Category::Source
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SUBSCRIPTION =
              T.let(
                :subscription,
                Courier::UserRecipient::Preferences::Category::Source::TaggedSymbol
              )
            LIST =
              T.let(
                :list,
                Courier::UserRecipient::Preferences::Category::Source::TaggedSymbol
              )
            RECIPIENT =
              T.let(
                :recipient,
                Courier::UserRecipient::Preferences::Category::Source::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Courier::UserRecipient::Preferences::Category::Source::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end
    end
  end
end
