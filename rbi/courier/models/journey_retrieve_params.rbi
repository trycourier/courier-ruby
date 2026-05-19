# typed: strong

module Courier
  module Models
    class JourneyRetrieveParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Courier::JourneyRetrieveParams, Courier::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :template_id

      # Version selector: `draft`, `published` (default), or `vN`.
      sig { returns(T.nilable(String)) }
      attr_reader :version

      sig { params(version: String).void }
      attr_writer :version

      sig do
        params(
          template_id: String,
          version: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        template_id:,
        # Version selector: `draft`, `published` (default), or `vN`.
        version: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            template_id: String,
            version: String,
            request_options: Courier::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
