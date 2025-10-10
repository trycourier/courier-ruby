# typed: strong

module Trycourier
  module Models
    module Users
      class PreferenceRetrieveTopicResponse < Trycourier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Trycourier::Models::Users::PreferenceRetrieveTopicResponse,
              Trycourier::Internal::AnyHash
            )
          end

        sig { returns(Trycourier::TopicPreference) }
        attr_reader :topic

        sig { params(topic: Trycourier::TopicPreference::OrHash).void }
        attr_writer :topic

        sig do
          params(topic: Trycourier::TopicPreference::OrHash).returns(
            T.attached_class
          )
        end
        def self.new(topic:)
        end

        sig { override.returns({ topic: Trycourier::TopicPreference }) }
        def to_hash
        end
      end
    end
  end
end
