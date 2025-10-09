# typed: strong

module Trycourier
  module Models
    module Profiles
      class ListRetrieveResponse < Trycourier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Trycourier::Models::Profiles::ListRetrieveResponse,
              Trycourier::Internal::AnyHash
            )
          end

        sig { returns(Trycourier::Paging) }
        attr_reader :paging

        sig { params(paging: Trycourier::Paging::OrHash).void }
        attr_writer :paging

        # An array of lists
        sig do
          returns(
            T::Array[Trycourier::Models::Profiles::ListRetrieveResponse::Result]
          )
        end
        attr_accessor :results

        sig do
          params(
            paging: Trycourier::Paging::OrHash,
            results:
              T::Array[
                Trycourier::Models::Profiles::ListRetrieveResponse::Result::OrHash
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          paging:,
          # An array of lists
          results:
        )
        end

        sig do
          override.returns(
            {
              paging: Trycourier::Paging,
              results:
                T::Array[
                  Trycourier::Models::Profiles::ListRetrieveResponse::Result
                ]
            }
          )
        end
        def to_hash
        end

        class Result < Trycourier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Trycourier::Models::Profiles::ListRetrieveResponse::Result,
                Trycourier::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          # The date/time of when the list was created. Represented as a string in ISO
          # format.
          sig { returns(String) }
          attr_accessor :created

          # List name
          sig { returns(String) }
          attr_accessor :name

          # The date/time of when the list was updated. Represented as a string in ISO
          # format.
          sig { returns(String) }
          attr_accessor :updated

          sig { returns(T.nilable(Trycourier::RecipientPreferences)) }
          attr_reader :preferences

          sig do
            params(
              preferences: T.nilable(Trycourier::RecipientPreferences::OrHash)
            ).void
          end
          attr_writer :preferences

          sig do
            params(
              id: String,
              created: String,
              name: String,
              updated: String,
              preferences: T.nilable(Trycourier::RecipientPreferences::OrHash)
            ).returns(T.attached_class)
          end
          def self.new(
            id:,
            # The date/time of when the list was created. Represented as a string in ISO
            # format.
            created:,
            # List name
            name:,
            # The date/time of when the list was updated. Represented as a string in ISO
            # format.
            updated:,
            preferences: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                created: String,
                name: String,
                updated: String,
                preferences: T.nilable(Trycourier::RecipientPreferences)
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
