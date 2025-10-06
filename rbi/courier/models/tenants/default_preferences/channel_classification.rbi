# typed: strong

module Courier
  module Models
    module Tenants
      module DefaultPreferences
        module ChannelClassification
          extend Courier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Courier::Tenants::DefaultPreferences::ChannelClassification
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          DIRECT_MESSAGE =
            T.let(
              :direct_message,
              Courier::Tenants::DefaultPreferences::ChannelClassification::TaggedSymbol
            )
          EMAIL =
            T.let(
              :email,
              Courier::Tenants::DefaultPreferences::ChannelClassification::TaggedSymbol
            )
          PUSH =
            T.let(
              :push,
              Courier::Tenants::DefaultPreferences::ChannelClassification::TaggedSymbol
            )
          SMS =
            T.let(
              :sms,
              Courier::Tenants::DefaultPreferences::ChannelClassification::TaggedSymbol
            )
          WEBHOOK =
            T.let(
              :webhook,
              Courier::Tenants::DefaultPreferences::ChannelClassification::TaggedSymbol
            )
          INBOX =
            T.let(
              :inbox,
              Courier::Tenants::DefaultPreferences::ChannelClassification::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Courier::Tenants::DefaultPreferences::ChannelClassification::TaggedSymbol
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
