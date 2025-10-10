# typed: strong

module Trycourier
  module Models
    module Users
      class TokenAddMultipleParams < Trycourier::Internal::Type::BaseModel
        extend Trycourier::Internal::Type::RequestParameters::Converter
        include Trycourier::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Trycourier::Users::TokenAddMultipleParams,
              Trycourier::Internal::AnyHash
            )
          end

        sig do
          params(request_options: Trycourier::RequestOptions::OrHash).returns(
            T.attached_class
          )
        end
        def self.new(request_options: {})
        end

        sig do
          override.returns({ request_options: Trycourier::RequestOptions })
        end
        def to_hash
        end
      end
    end
  end
end
