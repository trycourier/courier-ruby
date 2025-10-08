# typed: strong

module Courier
  module Models
    module Users
      class PreferenceRetrieveTopicResponse < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::Models::Users::PreferenceRetrieveTopicResponse,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(Courier::TopicPreference) }
        attr_reader :topic

        sig { params(topic: Courier::TopicPreference::OrHash).void }
        attr_writer :topic

        sig do
          params(topic: Courier::TopicPreference::OrHash).returns(
            T.attached_class
          )
        end
        def self.new(topic:)
        end

        sig { override.returns({ topic: Courier::TopicPreference }) }
        def to_hash
        end
      end
    end
  end
end
