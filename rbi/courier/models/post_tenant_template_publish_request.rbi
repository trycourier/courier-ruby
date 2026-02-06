# typed: strong

module Courier
  module Models
    class PostTenantTemplatePublishRequest < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::PostTenantTemplatePublishRequest,
            Courier::Internal::AnyHash
          )
        end

      # The version of the template to publish (e.g., "v1", "v2", "latest"). If not
      # provided, defaults to "latest".
      sig { returns(T.nilable(String)) }
      attr_reader :version

      sig { params(version: String).void }
      attr_writer :version

      # Request body for publishing a tenant template version
      sig { params(version: String).returns(T.attached_class) }
      def self.new(
        # The version of the template to publish (e.g., "v1", "v2", "latest"). If not
        # provided, defaults to "latest".
        version: nil
      )
      end

      sig { override.returns({ version: String }) }
      def to_hash
      end
    end
  end
end
