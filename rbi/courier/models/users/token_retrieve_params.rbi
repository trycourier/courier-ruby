# typed: strong

module Courier
  module Models
    module Users
      class TokenRetrieveParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Courier::Users::TokenRetrieveParams,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :user_id

        sig do
          params(
            user_id: String,
            request_options: Courier::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(user_id:, request_options: {})
        end

        sig do
          override.returns(
            { user_id: String, request_options: Courier::RequestOptions }
          )
        end
        def to_hash
        end
      end
    end
  end
end
