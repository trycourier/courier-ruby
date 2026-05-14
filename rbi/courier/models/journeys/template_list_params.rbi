# typed: strong

module Courier
  module Models
    module Journeys
      class TemplateListParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Courier::Journeys::TemplateListParams,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :template_id

        sig { returns(T.nilable(String)) }
        attr_reader :cursor

        sig { params(cursor: String).void }
        attr_writer :cursor

        sig { returns(T.nilable(Integer)) }
        attr_reader :limit

        sig { params(limit: Integer).void }
        attr_writer :limit

        sig do
          params(
            template_id: String,
            cursor: String,
            limit: Integer,
            request_options: Courier::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(template_id:, cursor: nil, limit: nil, request_options: {})
        end

        sig do
          override.returns(
            {
              template_id: String,
              cursor: String,
              limit: Integer,
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
