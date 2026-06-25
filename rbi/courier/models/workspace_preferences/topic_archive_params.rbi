# typed: strong

module Courier
  module Models
    module WorkspacePreferences
      class TopicArchiveParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Courier::WorkspacePreferences::TopicArchiveParams,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :section_id

        sig { returns(String) }
        attr_accessor :topic_id

        sig do
          params(
            section_id: String,
            topic_id: String,
            request_options: Courier::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(section_id:, topic_id:, request_options: {})
        end

        sig do
          override.returns(
            {
              section_id: String,
              topic_id: String,
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
