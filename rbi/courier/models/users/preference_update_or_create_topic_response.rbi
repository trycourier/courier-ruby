# typed: strong

module Courier
  module Models
    module Users
      class PreferenceUpdateOrCreateTopicResponse < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::Models::Users::PreferenceUpdateOrCreateTopicResponse,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :message

        sig { params(message: String).returns(T.attached_class) }
        def self.new(message:)
        end

        sig { override.returns({ message: String }) }
        def to_hash
        end
      end
    end
  end
end
