# typed: strong

module Courier
  module Models
    class TranslationUpdateParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Courier::TranslationUpdateParams, Courier::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :domain

      sig { returns(String) }
      attr_accessor :body

      sig do
        params(
          domain: String,
          body: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(domain:, body:, request_options: {})
      end

      sig do
        override.returns(
          {
            domain: String,
            body: String,
            request_options: Courier::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
