# typed: strong

module Trycourier
  module Models
    module Profiles
      class ListDeleteResponse < Trycourier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Trycourier::Models::Profiles::ListDeleteResponse,
              Trycourier::Internal::AnyHash
            )
          end

        sig do
          returns(
            Trycourier::Models::Profiles::ListDeleteResponse::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        sig do
          params(
            status:
              Trycourier::Models::Profiles::ListDeleteResponse::Status::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(status:)
        end

        sig do
          override.returns(
            {
              status:
                Trycourier::Models::Profiles::ListDeleteResponse::Status::TaggedSymbol
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
                Trycourier::Models::Profiles::ListDeleteResponse::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SUCCESS =
            T.let(
              :SUCCESS,
              Trycourier::Models::Profiles::ListDeleteResponse::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Trycourier::Models::Profiles::ListDeleteResponse::Status::TaggedSymbol
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
