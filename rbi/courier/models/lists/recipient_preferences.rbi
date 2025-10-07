# typed: strong

module Courier
  module Models
    module Lists
      class RecipientPreferences < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::Lists::RecipientPreferences,
              Courier::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(
              T::Hash[Symbol, Courier::Lists::RecipientPreferences::Category]
            )
          )
        end
        attr_accessor :categories

        sig do
          returns(
            T.nilable(
              T::Hash[
                Symbol,
                Courier::Lists::RecipientPreferences::Notification
              ]
            )
          )
        end
        attr_accessor :notifications

        sig do
          params(
            categories:
              T.nilable(
                T::Hash[
                  Symbol,
                  Courier::Lists::RecipientPreferences::Category::OrHash
                ]
              ),
            notifications:
              T.nilable(
                T::Hash[
                  Symbol,
                  Courier::Lists::RecipientPreferences::Notification::OrHash
                ]
              )
          ).returns(T.attached_class)
        end
        def self.new(categories: nil, notifications: nil)
        end

        sig do
          override.returns(
            {
              categories:
                T.nilable(
                  T::Hash[
                    Symbol,
                    Courier::Lists::RecipientPreferences::Category
                  ]
                ),
              notifications:
                T.nilable(
                  T::Hash[
                    Symbol,
                    Courier::Lists::RecipientPreferences::Notification
                  ]
                )
            }
          )
        end
        def to_hash
        end

        class Category < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::Lists::RecipientPreferences::Category,
                Courier::Internal::AnyHash
              )
            end

          sig { returns(Courier::Users::PreferenceStatus::OrSymbol) }
          attr_accessor :status

          sig do
            returns(
              T.nilable(
                T::Array[
                  Courier::Lists::RecipientPreferences::Category::ChannelPreference
                ]
              )
            )
          end
          attr_accessor :channel_preferences

          sig do
            returns(
              T.nilable(
                T::Array[Courier::Lists::RecipientPreferences::Category::Rule]
              )
            )
          end
          attr_accessor :rules

          sig do
            params(
              status: Courier::Users::PreferenceStatus::OrSymbol,
              channel_preferences:
                T.nilable(
                  T::Array[
                    Courier::Lists::RecipientPreferences::Category::ChannelPreference::OrHash
                  ]
                ),
              rules:
                T.nilable(
                  T::Array[
                    Courier::Lists::RecipientPreferences::Category::Rule::OrHash
                  ]
                )
            ).returns(T.attached_class)
          end
          def self.new(status:, channel_preferences: nil, rules: nil)
          end

          sig do
            override.returns(
              {
                status: Courier::Users::PreferenceStatus::OrSymbol,
                channel_preferences:
                  T.nilable(
                    T::Array[
                      Courier::Lists::RecipientPreferences::Category::ChannelPreference
                    ]
                  ),
                rules:
                  T.nilable(
                    T::Array[
                      Courier::Lists::RecipientPreferences::Category::Rule
                    ]
                  )
              }
            )
          end
          def to_hash
          end

          class ChannelPreference < Courier::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Courier::Lists::RecipientPreferences::Category::ChannelPreference,
                  Courier::Internal::AnyHash
                )
              end

            sig do
              returns(
                Courier::Tenants::DefaultPreferences::ChannelClassification::OrSymbol
              )
            end
            attr_accessor :channel

            sig do
              params(
                channel:
                  Courier::Tenants::DefaultPreferences::ChannelClassification::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(channel:)
            end

            sig do
              override.returns(
                {
                  channel:
                    Courier::Tenants::DefaultPreferences::ChannelClassification::OrSymbol
                }
              )
            end
            def to_hash
            end
          end

          class Rule < Courier::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Courier::Lists::RecipientPreferences::Category::Rule,
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
        end

        class Notification < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::Lists::RecipientPreferences::Notification,
                Courier::Internal::AnyHash
              )
            end

          sig { returns(Courier::Users::PreferenceStatus::OrSymbol) }
          attr_accessor :status

          sig do
            returns(
              T.nilable(
                T::Array[
                  Courier::Lists::RecipientPreferences::Notification::ChannelPreference
                ]
              )
            )
          end
          attr_accessor :channel_preferences

          sig do
            returns(
              T.nilable(
                T::Array[
                  Courier::Lists::RecipientPreferences::Notification::Rule
                ]
              )
            )
          end
          attr_accessor :rules

          sig do
            params(
              status: Courier::Users::PreferenceStatus::OrSymbol,
              channel_preferences:
                T.nilable(
                  T::Array[
                    Courier::Lists::RecipientPreferences::Notification::ChannelPreference::OrHash
                  ]
                ),
              rules:
                T.nilable(
                  T::Array[
                    Courier::Lists::RecipientPreferences::Notification::Rule::OrHash
                  ]
                )
            ).returns(T.attached_class)
          end
          def self.new(status:, channel_preferences: nil, rules: nil)
          end

          sig do
            override.returns(
              {
                status: Courier::Users::PreferenceStatus::OrSymbol,
                channel_preferences:
                  T.nilable(
                    T::Array[
                      Courier::Lists::RecipientPreferences::Notification::ChannelPreference
                    ]
                  ),
                rules:
                  T.nilable(
                    T::Array[
                      Courier::Lists::RecipientPreferences::Notification::Rule
                    ]
                  )
              }
            )
          end
          def to_hash
          end

          class ChannelPreference < Courier::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Courier::Lists::RecipientPreferences::Notification::ChannelPreference,
                  Courier::Internal::AnyHash
                )
              end

            sig do
              returns(
                Courier::Tenants::DefaultPreferences::ChannelClassification::OrSymbol
              )
            end
            attr_accessor :channel

            sig do
              params(
                channel:
                  Courier::Tenants::DefaultPreferences::ChannelClassification::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(channel:)
            end

            sig do
              override.returns(
                {
                  channel:
                    Courier::Tenants::DefaultPreferences::ChannelClassification::OrSymbol
                }
              )
            end
            def to_hash
            end
          end

          class Rule < Courier::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Courier::Lists::RecipientPreferences::Notification::Rule,
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
        end
      end
    end
  end
end
