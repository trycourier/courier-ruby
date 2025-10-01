# typed: strong

module Courier
  module Models
    module Profiles
      class ListSubscribeParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Courier::Profiles::ListSubscribeParams,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(T::Array[Courier::Profiles::ListSubscribeParams::List]) }
        attr_accessor :lists

        sig do
          params(
            lists:
              T::Array[Courier::Profiles::ListSubscribeParams::List::OrHash],
            request_options: Courier::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(lists:, request_options: {})
        end

        sig do
          override.returns(
            {
              lists: T::Array[Courier::Profiles::ListSubscribeParams::List],
              request_options: Courier::RequestOptions
            }
          )
        end
        def to_hash
        end

        class List < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::Profiles::ListSubscribeParams::List,
                Courier::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :list_id

          sig { returns(T.nilable(Courier::Lists::RecipientPreferences)) }
          attr_reader :preferences

          sig do
            params(
              preferences:
                T.nilable(Courier::Lists::RecipientPreferences::OrHash)
            ).void
          end
          attr_writer :preferences

          sig do
            params(
              list_id: String,
              preferences:
                T.nilable(Courier::Lists::RecipientPreferences::OrHash)
            ).returns(T.attached_class)
          end
          def self.new(list_id:, preferences: nil)
          end

          sig do
            override.returns(
              {
                list_id: String,
                preferences: T.nilable(Courier::Lists::RecipientPreferences)
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
