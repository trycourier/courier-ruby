# typed: strong

module Courier
  module Models
    class TranslationRetrieveParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Courier::TranslationRetrieveParams, Courier::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :domain

      sig do
        params(
          domain: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(domain:, request_options: {})
      end

      sig do
        override.returns(
          { domain: String, request_options: Courier::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
