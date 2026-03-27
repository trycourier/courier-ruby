# typed: strong

module Courier
  module Models
    class NotificationTemplatePublishRequest < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::NotificationTemplatePublishRequest,
            Courier::Internal::AnyHash
          )
        end

      # Historical version to publish (e.g. "v001"). Omit to publish the current draft.
      sig { returns(T.nilable(String)) }
      attr_reader :version

      sig { params(version: String).void }
      attr_writer :version

      # Optional request body for publishing a notification template. Omit or send an
      # empty object to publish the current draft.
      sig { params(version: String).returns(T.attached_class) }
      def self.new(
        # Historical version to publish (e.g. "v001"). Omit to publish the current draft.
        version: nil
      )
      end

      sig { override.returns({ version: String }) }
      def to_hash
      end
    end
  end
end
