# typed: strong

module Courier
  module Models
    module Notifications
      class CheckDeleteParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Courier::Notifications::CheckDeleteParams,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig do
          params(
            id: String,
            request_options: Courier::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(id:, request_options: {})
        end

        sig do
          override.returns(
            { id: String, request_options: Courier::RequestOptions }
          )
        end
        def to_hash
        end
      end
    end
  end
end
