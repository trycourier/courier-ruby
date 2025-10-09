# typed: strong

module Trycourier
  module Models
    class TranslationUpdateParams < Trycourier::Internal::Type::BaseModel
      extend Trycourier::Internal::Type::RequestParameters::Converter
      include Trycourier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Trycourier::TranslationUpdateParams,
            Trycourier::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :domain

      sig { returns(String) }
      attr_accessor :body

      sig do
        params(
          domain: String,
          body: String,
          request_options: Trycourier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(domain:, body:, request_options: {})
      end

      sig do
        override.returns(
          {
            domain: String,
            body: String,
            request_options: Trycourier::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
