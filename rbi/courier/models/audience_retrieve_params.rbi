# typed: strong

module Courier
  module Models
    class AudienceRetrieveParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Courier::AudienceRetrieveParams, Courier::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :audience_id

      sig do
        params(
          audience_id: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(audience_id:, request_options: {})
      end

      sig do
        override.returns(
          { audience_id: String, request_options: Courier::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
