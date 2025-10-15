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

        sig { returns(T::Array[Trycourier::SubscribeToListsRequestItem]) }
        attr_accessor :lists

        sig do
          params(
            lists: T::Array[Trycourier::SubscribeToListsRequestItem::OrHash],
            request_options: Trycourier::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(lists:, request_options: {})
        end

        sig do
          override.returns(
            {
              lists: T::Array[Trycourier::SubscribeToListsRequestItem],
              request_options: Trycourier::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
