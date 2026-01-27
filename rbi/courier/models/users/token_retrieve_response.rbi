# typed: strong

module Courier
  module Models
    module Users
      class TokenRetrieveResponse < Courier::Models::Users::UserToken
        OrHash =
          T.type_alias do
            T.any(
              Courier::Models::Users::TokenRetrieveResponse,
              Courier::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(
              Courier::Models::Users::TokenRetrieveResponse::Status::TaggedSymbol
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
                Courier::Models::Users::TokenRetrieveResponse::Status::OrSymbol
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
                  Courier::Models::Users::TokenRetrieveResponse::Status::TaggedSymbol
                ),
              status_reason: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        module Status
          extend Courier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Courier::Models::Users::TokenRetrieveResponse::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ACTIVE =
            T.let(
              :active,
              Courier::Models::Users::TokenRetrieveResponse::Status::TaggedSymbol
            )
          UNKNOWN =
            T.let(
              :unknown,
              Courier::Models::Users::TokenRetrieveResponse::Status::TaggedSymbol
            )
          FAILED =
            T.let(
              :failed,
              Courier::Models::Users::TokenRetrieveResponse::Status::TaggedSymbol
            )
          REVOKED =
            T.let(
              :revoked,
              Courier::Models::Users::TokenRetrieveResponse::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Courier::Models::Users::TokenRetrieveResponse::Status::TaggedSymbol
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
