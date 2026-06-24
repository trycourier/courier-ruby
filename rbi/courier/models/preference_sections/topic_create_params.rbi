# typed: strong

module Courier
  module Models
    module PreferenceSections
      class TopicCreateParams < Courier::Models::PreferenceTopicCreateRequest
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Courier::PreferenceSections::TopicCreateParams,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :section_id

        sig do
          params(
            section_id: String,
            request_options: Courier::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(section_id:, request_options: {})
        end

        sig do
          override.returns(
            { section_id: String, request_options: Courier::RequestOptions }
          )
        end
        def to_hash
        end
      end
    end
  end
end
