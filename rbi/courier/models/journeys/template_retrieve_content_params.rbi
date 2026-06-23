# typed: strong

module Courier
  module Models
    module Journeys
      class TemplateRetrieveContentParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Courier::Journeys::TemplateRetrieveContentParams,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :template_id

        sig { returns(String) }
        attr_accessor :notification_id

        # Accepts `draft`, `published`, or a version string (e.g., `v001`). Defaults to
        # `published`.
        sig { returns(T.nilable(String)) }
        attr_reader :version

        sig { params(version: String).void }
        attr_writer :version

        sig do
          params(
            template_id: String,
            notification_id: String,
            version: String,
            request_options: Courier::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          template_id:,
          notification_id:,
          # Accepts `draft`, `published`, or a version string (e.g., `v001`). Defaults to
          # `published`.
          version: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              template_id: String,
              notification_id: String,
              version: String,
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
