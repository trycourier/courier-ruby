# typed: strong

module Courier
  module Models
    module Notifications
      module Previews
        class RunRetrieveParams < Courier::Internal::Type::BaseModel
          extend Courier::Internal::Type::RequestParameters::Converter
          include Courier::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Courier::Notifications::Previews::RunRetrieveParams,
                Courier::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          sig { returns(String) }
          attr_accessor :preview_run_id

          sig do
            params(
              id: String,
              preview_run_id: String,
              request_options: Courier::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(id:, preview_run_id:, request_options: {})
          end

          sig do
            override.returns(
              {
                id: String,
                preview_run_id: String,
                request_options: Courier::RequestOptions
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
