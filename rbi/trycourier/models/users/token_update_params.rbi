# typed: strong

module Trycourier
  module Models
    module Users
      class TokenUpdateParams < Trycourier::Internal::Type::BaseModel
        extend Trycourier::Internal::Type::RequestParameters::Converter
        include Trycourier::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Trycourier::Users::TokenUpdateParams,
              Trycourier::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :user_id

        sig { returns(T::Array[Trycourier::Users::TokenUpdateParams::Patch]) }
        attr_accessor :patch

        sig do
          params(
            user_id: String,
            patch:
              T::Array[Trycourier::Users::TokenUpdateParams::Patch::OrHash],
            request_options: Trycourier::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(user_id:, patch:, request_options: {})
        end

        sig do
          override.returns(
            {
              user_id: String,
              patch: T::Array[Trycourier::Users::TokenUpdateParams::Patch],
              request_options: Trycourier::RequestOptions
            }
          )
        end
        def to_hash
        end

        class Patch < Trycourier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Trycourier::Users::TokenUpdateParams::Patch,
                Trycourier::Internal::AnyHash
              )
            end

          # The operation to perform.
          sig { returns(String) }
          attr_accessor :op

          # The JSON path specifying the part of the profile to operate on.
          sig { returns(String) }
          attr_accessor :path

          # The value for the operation.
          sig { returns(T.nilable(String)) }
          attr_accessor :value

          sig do
            params(op: String, path: String, value: T.nilable(String)).returns(
              T.attached_class
            )
          end
          def self.new(
            # The operation to perform.
            op:,
            # The JSON path specifying the part of the profile to operate on.
            path:,
            # The value for the operation.
            value: nil
          )
          end

          sig do
            override.returns(
              { op: String, path: String, value: T.nilable(String) }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
