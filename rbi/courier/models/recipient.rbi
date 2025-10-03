# typed: strong

module Courier
  module Models
    class Recipient < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Courier::Recipient, Courier::Internal::AnyHash) }

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

      sig { returns(T.nilable(Courier::Recipient::Preferences)) }
      attr_reader :preferences

      sig do
        params(
          preferences: T.nilable(Courier::Recipient::Preferences::OrHash)
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
          preferences: T.nilable(Courier::Recipient::Preferences::OrHash),
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
            preferences: T.nilable(Courier::Recipient::Preferences),
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
            T.any(Courier::Recipient::Preferences, Courier::Internal::AnyHash)
          end

        sig do
          returns(
            T::Hash[Symbol, Courier::Recipient::Preferences::Notification]
          )
        end
        attr_accessor :notifications

        sig do
          returns(
            T.nilable(
              T::Hash[Symbol, Courier::Recipient::Preferences::Category]
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
                Courier::Recipient::Preferences::Notification::OrHash
              ],
            categories:
              T.nilable(
                T::Hash[
                  Symbol,
                  Courier::Recipient::Preferences::Category::OrHash
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
                T::Hash[Symbol, Courier::Recipient::Preferences::Notification],
              categories:
                T.nilable(
                  T::Hash[Symbol, Courier::Recipient::Preferences::Category]
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
                Courier::Recipient::Preferences::Notification,
                Courier::Internal::AnyHash
              )
            end

          sig do
            returns(
              Courier::Recipient::Preferences::Notification::Status::OrSymbol
            )
          end
          attr_accessor :status

          sig do
            returns(
              T.nilable(
                T::Array[
                  Courier::Recipient::Preferences::Notification::ChannelPreference
                ]
              )
            )
          end
          attr_accessor :channel_preferences

          sig do
            returns(
              T.nilable(
                T::Array[Courier::Recipient::Preferences::Notification::Rule]
              )
            )
          end
          attr_accessor :rules

          sig do
            returns(
              T.nilable(
                Courier::Recipient::Preferences::Notification::Source::OrSymbol
              )
            )
          end
          attr_accessor :source

          sig do
            params(
              status:
                Courier::Recipient::Preferences::Notification::Status::OrSymbol,
              channel_preferences:
                T.nilable(
                  T::Array[
                    Courier::Recipient::Preferences::Notification::ChannelPreference::OrHash
                  ]
                ),
              rules:
                T.nilable(
                  T::Array[
                    Courier::Recipient::Preferences::Notification::Rule::OrHash
                  ]
                ),
              source:
                T.nilable(
                  Courier::Recipient::Preferences::Notification::Source::OrSymbol
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
                status:
                  Courier::Recipient::Preferences::Notification::Status::OrSymbol,
                channel_preferences:
                  T.nilable(
                    T::Array[
                      Courier::Recipient::Preferences::Notification::ChannelPreference
                    ]
                  ),
                rules:
                  T.nilable(
                    T::Array[
                      Courier::Recipient::Preferences::Notification::Rule
                    ]
                  ),
                source:
                  T.nilable(
                    Courier::Recipient::Preferences::Notification::Source::OrSymbol
                  )
              }
            )
          end
          def to_hash
          end

          module Status
            extend Courier::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Courier::Recipient::Preferences::Notification::Status
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            OPTED_IN =
              T.let(
                :OPTED_IN,
                Courier::Recipient::Preferences::Notification::Status::TaggedSymbol
              )
            OPTED_OUT =
              T.let(
                :OPTED_OUT,
                Courier::Recipient::Preferences::Notification::Status::TaggedSymbol
              )
            REQUIRED =
              T.let(
                :REQUIRED,
                Courier::Recipient::Preferences::Notification::Status::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Courier::Recipient::Preferences::Notification::Status::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class ChannelPreference < Courier::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Courier::Recipient::Preferences::Notification::ChannelPreference,
                  Courier::Internal::AnyHash
                )
              end

            sig do
              returns(
                Courier::Recipient::Preferences::Notification::ChannelPreference::Channel::OrSymbol
              )
            end
            attr_accessor :channel

            sig do
              params(
                channel:
                  Courier::Recipient::Preferences::Notification::ChannelPreference::Channel::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(channel:)
            end

            sig do
              override.returns(
                {
                  channel:
                    Courier::Recipient::Preferences::Notification::ChannelPreference::Channel::OrSymbol
                }
              )
            end
            def to_hash
            end

            module Channel
              extend Courier::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Courier::Recipient::Preferences::Notification::ChannelPreference::Channel
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              DIRECT_MESSAGE =
                T.let(
                  :direct_message,
                  Courier::Recipient::Preferences::Notification::ChannelPreference::Channel::TaggedSymbol
                )
              EMAIL =
                T.let(
                  :email,
                  Courier::Recipient::Preferences::Notification::ChannelPreference::Channel::TaggedSymbol
                )
              PUSH =
                T.let(
                  :push,
                  Courier::Recipient::Preferences::Notification::ChannelPreference::Channel::TaggedSymbol
                )
              SMS =
                T.let(
                  :sms,
                  Courier::Recipient::Preferences::Notification::ChannelPreference::Channel::TaggedSymbol
                )
              WEBHOOK =
                T.let(
                  :webhook,
                  Courier::Recipient::Preferences::Notification::ChannelPreference::Channel::TaggedSymbol
                )
              INBOX =
                T.let(
                  :inbox,
                  Courier::Recipient::Preferences::Notification::ChannelPreference::Channel::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Courier::Recipient::Preferences::Notification::ChannelPreference::Channel::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class Rule < Courier::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Courier::Recipient::Preferences::Notification::Rule,
                  Courier::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :until_

            sig { returns(T.nilable(String)) }
            attr_accessor :start

            sig do
              params(until_: String, start: T.nilable(String)).returns(
                T.attached_class
              )
            end
            def self.new(until_:, start: nil)
            end

            sig do
              override.returns({ until_: String, start: T.nilable(String) })
            end
            def to_hash
            end
          end

          module Source
            extend Courier::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Courier::Recipient::Preferences::Notification::Source
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SUBSCRIPTION =
              T.let(
                :subscription,
                Courier::Recipient::Preferences::Notification::Source::TaggedSymbol
              )
            LIST =
              T.let(
                :list,
                Courier::Recipient::Preferences::Notification::Source::TaggedSymbol
              )
            RECIPIENT =
              T.let(
                :recipient,
                Courier::Recipient::Preferences::Notification::Source::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Courier::Recipient::Preferences::Notification::Source::TaggedSymbol
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
                Courier::Recipient::Preferences::Category,
                Courier::Internal::AnyHash
              )
            end

          sig do
            returns(Courier::Recipient::Preferences::Category::Status::OrSymbol)
          end
          attr_accessor :status

          sig do
            returns(
              T.nilable(
                T::Array[
                  Courier::Recipient::Preferences::Category::ChannelPreference
                ]
              )
            )
          end
          attr_accessor :channel_preferences

          sig do
            returns(
              T.nilable(
                T::Array[Courier::Recipient::Preferences::Category::Rule]
              )
            )
          end
          attr_accessor :rules

          sig do
            returns(
              T.nilable(
                Courier::Recipient::Preferences::Category::Source::OrSymbol
              )
            )
          end
          attr_accessor :source

          sig do
            params(
              status:
                Courier::Recipient::Preferences::Category::Status::OrSymbol,
              channel_preferences:
                T.nilable(
                  T::Array[
                    Courier::Recipient::Preferences::Category::ChannelPreference::OrHash
                  ]
                ),
              rules:
                T.nilable(
                  T::Array[
                    Courier::Recipient::Preferences::Category::Rule::OrHash
                  ]
                ),
              source:
                T.nilable(
                  Courier::Recipient::Preferences::Category::Source::OrSymbol
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
                status:
                  Courier::Recipient::Preferences::Category::Status::OrSymbol,
                channel_preferences:
                  T.nilable(
                    T::Array[
                      Courier::Recipient::Preferences::Category::ChannelPreference
                    ]
                  ),
                rules:
                  T.nilable(
                    T::Array[Courier::Recipient::Preferences::Category::Rule]
                  ),
                source:
                  T.nilable(
                    Courier::Recipient::Preferences::Category::Source::OrSymbol
                  )
              }
            )
          end
          def to_hash
          end

          module Status
            extend Courier::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(Symbol, Courier::Recipient::Preferences::Category::Status)
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            OPTED_IN =
              T.let(
                :OPTED_IN,
                Courier::Recipient::Preferences::Category::Status::TaggedSymbol
              )
            OPTED_OUT =
              T.let(
                :OPTED_OUT,
                Courier::Recipient::Preferences::Category::Status::TaggedSymbol
              )
            REQUIRED =
              T.let(
                :REQUIRED,
                Courier::Recipient::Preferences::Category::Status::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Courier::Recipient::Preferences::Category::Status::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class ChannelPreference < Courier::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Courier::Recipient::Preferences::Category::ChannelPreference,
                  Courier::Internal::AnyHash
                )
              end

            sig do
              returns(
                Courier::Recipient::Preferences::Category::ChannelPreference::Channel::OrSymbol
              )
            end
            attr_accessor :channel

            sig do
              params(
                channel:
                  Courier::Recipient::Preferences::Category::ChannelPreference::Channel::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(channel:)
            end

            sig do
              override.returns(
                {
                  channel:
                    Courier::Recipient::Preferences::Category::ChannelPreference::Channel::OrSymbol
                }
              )
            end
            def to_hash
            end

            module Channel
              extend Courier::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Courier::Recipient::Preferences::Category::ChannelPreference::Channel
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              DIRECT_MESSAGE =
                T.let(
                  :direct_message,
                  Courier::Recipient::Preferences::Category::ChannelPreference::Channel::TaggedSymbol
                )
              EMAIL =
                T.let(
                  :email,
                  Courier::Recipient::Preferences::Category::ChannelPreference::Channel::TaggedSymbol
                )
              PUSH =
                T.let(
                  :push,
                  Courier::Recipient::Preferences::Category::ChannelPreference::Channel::TaggedSymbol
                )
              SMS =
                T.let(
                  :sms,
                  Courier::Recipient::Preferences::Category::ChannelPreference::Channel::TaggedSymbol
                )
              WEBHOOK =
                T.let(
                  :webhook,
                  Courier::Recipient::Preferences::Category::ChannelPreference::Channel::TaggedSymbol
                )
              INBOX =
                T.let(
                  :inbox,
                  Courier::Recipient::Preferences::Category::ChannelPreference::Channel::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Courier::Recipient::Preferences::Category::ChannelPreference::Channel::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class Rule < Courier::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Courier::Recipient::Preferences::Category::Rule,
                  Courier::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :until_

            sig { returns(T.nilable(String)) }
            attr_accessor :start

            sig do
              params(until_: String, start: T.nilable(String)).returns(
                T.attached_class
              )
            end
            def self.new(until_:, start: nil)
            end

            sig do
              override.returns({ until_: String, start: T.nilable(String) })
            end
            def to_hash
            end
          end

          module Source
            extend Courier::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(Symbol, Courier::Recipient::Preferences::Category::Source)
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SUBSCRIPTION =
              T.let(
                :subscription,
                Courier::Recipient::Preferences::Category::Source::TaggedSymbol
              )
            LIST =
              T.let(
                :list,
                Courier::Recipient::Preferences::Category::Source::TaggedSymbol
              )
            RECIPIENT =
              T.let(
                :recipient,
                Courier::Recipient::Preferences::Category::Source::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Courier::Recipient::Preferences::Category::Source::TaggedSymbol
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
