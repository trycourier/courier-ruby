# typed: strong

module Courier
  module Models
    class AudienceDeleteParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Courier::AudienceDeleteParams, Courier::Internal::AnyHash)
        end

      sig do
        params(request_options: Courier::RequestOptions::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(request_options: {})
      end

      sig { override.returns({ request_options: Courier::RequestOptions }) }
      def to_hash
      end
    end
  end
end
