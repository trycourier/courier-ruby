# typed: strong

module Courier
  module Models
    class ListUpdateParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Courier::ListUpdateParams, Courier::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :name

      sig { returns(T.nilable(Courier::RecipientPreferences)) }
      attr_reader :preferences

      sig do
        params(
          preferences: T.nilable(Courier::RecipientPreferences::OrHash)
        ).void
      end
      attr_writer :preferences

      sig do
        params(
          name: String,
          preferences: T.nilable(Courier::RecipientPreferences::OrHash),
          request_options: Courier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(name:, preferences: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            name: String,
            preferences: T.nilable(Courier::RecipientPreferences),
            request_options: Courier::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
