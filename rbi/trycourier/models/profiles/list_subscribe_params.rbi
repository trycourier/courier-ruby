# typed: strong

module Trycourier
  module Models
    module Profiles
      class ListSubscribeParams < Trycourier::Internal::Type::BaseModel
        extend Trycourier::Internal::Type::RequestParameters::Converter
        include Trycourier::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Trycourier::Profiles::ListSubscribeParams,
              Trycourier::Internal::AnyHash
            )
          end

        sig do
          returns(T::Array[Trycourier::Profiles::ListSubscribeParams::List])
        end
        attr_accessor :lists

        sig do
          params(
            lists:
              T::Array[Trycourier::Profiles::ListSubscribeParams::List::OrHash],
            request_options: Trycourier::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(lists:, request_options: {})
        end

        sig do
          override.returns(
            {
              lists: T::Array[Trycourier::Profiles::ListSubscribeParams::List],
              request_options: Trycourier::RequestOptions
            }
          )
        end
        def to_hash
        end

        class List < Trycourier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Trycourier::Profiles::ListSubscribeParams::List,
                Trycourier::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :list_id

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
              list_id: String,
              preferences: T.nilable(Trycourier::RecipientPreferences::OrHash)
            ).returns(T.attached_class)
          end
          def self.new(list_id:, preferences: nil)
          end

          sig do
            override.returns(
              {
                list_id: String,
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
