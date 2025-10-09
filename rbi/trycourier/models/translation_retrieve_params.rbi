# typed: strong

module Trycourier
  module Models
    class TranslationRetrieveParams < Trycourier::Internal::Type::BaseModel
      extend Trycourier::Internal::Type::RequestParameters::Converter
      include Trycourier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Trycourier::TranslationRetrieveParams,
            Trycourier::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :domain

      sig do
        params(
          domain: String,
          request_options: Trycourier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(domain:, request_options: {})
      end

      sig do
        override.returns(
          { domain: String, request_options: Trycourier::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
