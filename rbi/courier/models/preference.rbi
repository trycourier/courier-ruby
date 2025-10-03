# typed: strong

module Courier
  module Models
    class Preference < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Courier::Preference, Courier::Internal::AnyHash) }

      sig { returns(Courier::Preference::Status::OrSymbol) }
      attr_accessor :status

      sig do
        returns(T.nilable(T::Array[Courier::Preference::ChannelPreference]))
      end
      attr_accessor :channel_preferences

      sig { returns(T.nilable(T::Array[Courier::Preference::Rule])) }
      attr_accessor :rules

      sig { returns(T.nilable(Courier::Preference::Source::OrSymbol)) }
      attr_accessor :source

      sig do
        params(
          status: Courier::Preference::Status::OrSymbol,
          channel_preferences:
            T.nilable(T::Array[Courier::Preference::ChannelPreference::OrHash]),
          rules: T.nilable(T::Array[Courier::Preference::Rule::OrHash]),
          source: T.nilable(Courier::Preference::Source::OrSymbol)
        ).returns(T.attached_class)
      end
      def self.new(status:, channel_preferences: nil, rules: nil, source: nil)
      end

      sig do
        override.returns(
          {
            status: Courier::Preference::Status::OrSymbol,
            channel_preferences:
              T.nilable(T::Array[Courier::Preference::ChannelPreference]),
            rules: T.nilable(T::Array[Courier::Preference::Rule]),
            source: T.nilable(Courier::Preference::Source::OrSymbol)
          }
        )
      end
      def to_hash
      end

      module Status
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Courier::Preference::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        OPTED_IN = T.let(:OPTED_IN, Courier::Preference::Status::TaggedSymbol)
        OPTED_OUT = T.let(:OPTED_OUT, Courier::Preference::Status::TaggedSymbol)
        REQUIRED = T.let(:REQUIRED, Courier::Preference::Status::TaggedSymbol)

        sig do
          override.returns(T::Array[Courier::Preference::Status::TaggedSymbol])
        end
        def self.values
        end
      end

      class ChannelPreference < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::Preference::ChannelPreference,
              Courier::Internal::AnyHash
            )
          end

        sig do
          returns(Courier::Preference::ChannelPreference::Channel::OrSymbol)
        end
        attr_accessor :channel

        sig do
          params(
            channel: Courier::Preference::ChannelPreference::Channel::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(channel:)
        end

        sig do
          override.returns(
            {
              channel: Courier::Preference::ChannelPreference::Channel::OrSymbol
            }
          )
        end
        def to_hash
        end

        module Channel
          extend Courier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Courier::Preference::ChannelPreference::Channel)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          DIRECT_MESSAGE =
            T.let(
              :direct_message,
              Courier::Preference::ChannelPreference::Channel::TaggedSymbol
            )
          EMAIL =
            T.let(
              :email,
              Courier::Preference::ChannelPreference::Channel::TaggedSymbol
            )
          PUSH =
            T.let(
              :push,
              Courier::Preference::ChannelPreference::Channel::TaggedSymbol
            )
          SMS =
            T.let(
              :sms,
              Courier::Preference::ChannelPreference::Channel::TaggedSymbol
            )
          WEBHOOK =
            T.let(
              :webhook,
              Courier::Preference::ChannelPreference::Channel::TaggedSymbol
            )
          INBOX =
            T.let(
              :inbox,
              Courier::Preference::ChannelPreference::Channel::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Courier::Preference::ChannelPreference::Channel::TaggedSymbol
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
            T.any(Courier::Preference::Rule, Courier::Internal::AnyHash)
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

        sig { override.returns({ until_: String, start: T.nilable(String) }) }
        def to_hash
        end
      end

      module Source
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Courier::Preference::Source) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SUBSCRIPTION =
          T.let(:subscription, Courier::Preference::Source::TaggedSymbol)
        LIST = T.let(:list, Courier::Preference::Source::TaggedSymbol)
        RECIPIENT = T.let(:recipient, Courier::Preference::Source::TaggedSymbol)

        sig do
          override.returns(T::Array[Courier::Preference::Source::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
