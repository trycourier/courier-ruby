# typed: strong

module Courier
  module Models
    module Profiles
      class ListSubscribeResponse < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::Models::Profiles::ListSubscribeResponse,
              Courier::Internal::AnyHash
            )
          end

        sig do
          returns(
            Courier::Models::Profiles::ListSubscribeResponse::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        sig do
          params(
            status:
              Courier::Models::Profiles::ListSubscribeResponse::Status::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(status:)
        end

        sig do
          override.returns(
            {
              status:
                Courier::Models::Profiles::ListSubscribeResponse::Status::TaggedSymbol
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
                Courier::Models::Profiles::ListSubscribeResponse::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SUCCESS =
            T.let(
              :SUCCESS,
              Courier::Models::Profiles::ListSubscribeResponse::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Courier::Models::Profiles::ListSubscribeResponse::Status::TaggedSymbol
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
