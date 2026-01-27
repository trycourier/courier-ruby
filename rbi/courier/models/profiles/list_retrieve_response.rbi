# typed: strong

module Courier
  module Models
    module Profiles
      class ListRetrieveResponse < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::Models::Profiles::ListRetrieveResponse,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(Courier::Paging) }
        attr_reader :paging

        sig { params(paging: Courier::Paging::OrHash).void }
        attr_writer :paging

        # An array of lists
        sig do
          returns(
            T::Array[Courier::Models::Profiles::ListRetrieveResponse::Result]
          )
        end
        attr_accessor :results

        sig do
          params(
            paging: Courier::Paging::OrHash,
            results:
              T::Array[
                Courier::Models::Profiles::ListRetrieveResponse::Result::OrHash
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
              paging: Courier::Paging,
              results:
                T::Array[
                  Courier::Models::Profiles::ListRetrieveResponse::Result
                ]
            }
          )
        end
        def to_hash
        end

        class Result < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::Models::Profiles::ListRetrieveResponse::Result,
                Courier::Internal::AnyHash
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

          sig { returns(T.nilable(Courier::RecipientPreferences)) }
          attr_reader :preferences

          sig do
            params(
              preferences: T.nilable(Courier::RecipientPreferences::OrHash)
            ).void
          end
          attr_writer :preferences

          sig do
            params(
              id: String,
              created: String,
              name: String,
              updated: String,
              preferences: T.nilable(Courier::RecipientPreferences::OrHash)
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
                preferences: T.nilable(Courier::RecipientPreferences)
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
