# typed: strong

module Trycourier
  module Models
    module Users
      class TokenDeleteParams < Trycourier::Internal::Type::BaseModel
        extend Trycourier::Internal::Type::RequestParameters::Converter
        include Trycourier::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Trycourier::Users::TokenDeleteParams,
              Trycourier::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :user_id

        sig do
          params(
            user_id: String,
            request_options: Trycourier::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(user_id:, request_options: {})
        end

        sig do
          override.returns(
            { user_id: String, request_options: Trycourier::RequestOptions }
          )
        end
        def to_hash
        end
      end
    end
  end
end
