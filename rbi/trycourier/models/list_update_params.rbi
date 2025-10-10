# typed: strong

module Trycourier
  module Models
    class ListUpdateParams < Trycourier::Internal::Type::BaseModel
      extend Trycourier::Internal::Type::RequestParameters::Converter
      include Trycourier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Trycourier::ListUpdateParams, Trycourier::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :name

      sig { returns(T.nilable(Trycourier::RecipientPreferences)) }
      attr_reader :preferences

      sig do
        params(
          preferences: T.nilable(Trycourier::RecipientPreferences::OrHash)
        ).void
      end
      attr_writer :preferences

      sig do
        params(
          name: String,
          preferences: T.nilable(Trycourier::RecipientPreferences::OrHash),
          request_options: Trycourier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(name:, preferences: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            name: String,
            preferences: T.nilable(Trycourier::RecipientPreferences),
            request_options: Trycourier::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
