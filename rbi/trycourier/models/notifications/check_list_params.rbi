# typed: strong

module Trycourier
  module Models
    module Notifications
      class CheckListParams < Trycourier::Internal::Type::BaseModel
        extend Trycourier::Internal::Type::RequestParameters::Converter
        include Trycourier::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Trycourier::Notifications::CheckListParams,
              Trycourier::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig do
          params(
            id: String,
            request_options: Trycourier::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(id:, request_options: {})
        end

        sig do
          override.returns(
            { id: String, request_options: Trycourier::RequestOptions }
          )
        end
        def to_hash
        end
      end
    end
  end
end
