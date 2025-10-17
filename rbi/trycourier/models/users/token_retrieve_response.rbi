# typed: strong

module Trycourier
  module Models
    module Users
      class TokenRetrieveResponse < Trycourier::Models::Users::UserToken
        OrHash =
          T.type_alias do
            T.any(
              Trycourier::Models::Users::TokenRetrieveResponse,
              Trycourier::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(
              Trycourier::Models::Users::TokenRetrieveResponse::Status::TaggedSymbol
            )
          )
        end
        attr_accessor :status

        # The reason for the token status.
        sig { returns(T.nilable(String)) }
        attr_accessor :status_reason

        sig do
          params(
            status:
              T.nilable(
                Trycourier::Models::Users::TokenRetrieveResponse::Status::OrSymbol
              ),
            status_reason: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          status: nil,
          # The reason for the token status.
          status_reason: nil
        )
        end

        sig do
          override.returns(
            {
              status:
                T.nilable(
                  Trycourier::Models::Users::TokenRetrieveResponse::Status::TaggedSymbol
                ),
              status_reason: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        module Status
          extend Trycourier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Trycourier::Models::Users::TokenRetrieveResponse::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ACTIVE =
            T.let(
              :active,
              Trycourier::Models::Users::TokenRetrieveResponse::Status::TaggedSymbol
            )
          UNKNOWN =
            T.let(
              :unknown,
              Trycourier::Models::Users::TokenRetrieveResponse::Status::TaggedSymbol
            )
          FAILED =
            T.let(
              :failed,
              Trycourier::Models::Users::TokenRetrieveResponse::Status::TaggedSymbol
            )
          REVOKED =
            T.let(
              :revoked,
              Trycourier::Models::Users::TokenRetrieveResponse::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Trycourier::Models::Users::TokenRetrieveResponse::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
