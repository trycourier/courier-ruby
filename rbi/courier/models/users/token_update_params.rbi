# typed: strong

module Courier
  module Models
    module Users
      class TokenUpdateParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(Courier::Users::TokenUpdateParams, Courier::Internal::AnyHash)
          end

        sig { returns(String) }
        attr_accessor :user_id

        sig { returns(String) }
        attr_accessor :token

        sig { returns(T::Array[Courier::Users::TokenUpdateParams::Patch]) }
        attr_accessor :patch

        sig do
          params(
            user_id: String,
            token: String,
            patch: T::Array[Courier::Users::TokenUpdateParams::Patch::OrHash],
            request_options: Courier::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(user_id:, token:, patch:, request_options: {})
        end

        sig do
          override.returns(
            {
              user_id: String,
              token: String,
              patch: T::Array[Courier::Users::TokenUpdateParams::Patch],
              request_options: Courier::RequestOptions
            }
          )
        end
        def to_hash
        end

        class Patch < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::Users::TokenUpdateParams::Patch,
                Courier::Internal::AnyHash
              )
            end

          # The operation to perform.
          sig { returns(String) }
          attr_accessor :op

          # The JSON path specifying the part of the profile to operate on.
          sig { returns(String) }
          attr_accessor :path

          # The value for the operation. A string for most fields; boolean `false` when
          # disabling token expiration via `expiry_date`, which cannot be expressed as a
          # string.
          sig do
            returns(
              T.nilable(
                Courier::Users::TokenUpdateParams::Patch::Value::Variants
              )
            )
          end
          attr_accessor :value

          sig do
            params(
              op: String,
              path: String,
              value:
                T.nilable(
                  Courier::Users::TokenUpdateParams::Patch::Value::Variants
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # The operation to perform.
            op:,
            # The JSON path specifying the part of the profile to operate on.
            path:,
            # The value for the operation. A string for most fields; boolean `false` when
            # disabling token expiration via `expiry_date`, which cannot be expressed as a
            # string.
            value: nil
          )
          end

          sig do
            override.returns(
              {
                op: String,
                path: String,
                value:
                  T.nilable(
                    Courier::Users::TokenUpdateParams::Patch::Value::Variants
                  )
              }
            )
          end
          def to_hash
          end

          # The value for the operation. A string for most fields; boolean `false` when
          # disabling token expiration via `expiry_date`, which cannot be expressed as a
          # string.
          module Value
            extend Courier::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(String, T::Boolean, T::Hash[Symbol, T.anything])
              end

            sig do
              override.returns(
                T::Array[
                  Courier::Users::TokenUpdateParams::Patch::Value::Variants
                ]
              )
            end
            def self.variants
            end

            UnionMember2Map =
              T.let(
                Courier::Internal::Type::HashOf[
                  Courier::Internal::Type::Unknown
                ],
                Courier::Internal::Type::Converter
              )
          end
        end
      end
    end
  end
end
