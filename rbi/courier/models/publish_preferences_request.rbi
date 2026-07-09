# typed: strong

module Courier
  module Models
    class PublishPreferencesRequest < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::PublishPreferencesRequest, Courier::Internal::AnyHash)
        end

      # Brand for the hosted page - "default" (workspace default brand), "none" (no
      # brand), or a specific brand id. Defaults to "default".
      sig { returns(T.nilable(String)) }
      attr_accessor :brand_id

      # Description shown under the heading on the hosted preferences page.
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # Heading shown at the top of the hosted preferences page.
      sig { returns(T.nilable(String)) }
      attr_accessor :heading

      # Optional page metadata to apply when publishing the workspace's preferences
      # page. All fields are optional; omitted fields fall back to the page defaults
      # (and the workspace default brand).
      sig do
        params(
          brand_id: T.nilable(String),
          description: T.nilable(String),
          heading: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Brand for the hosted page - "default" (workspace default brand), "none" (no
        # brand), or a specific brand id. Defaults to "default".
        brand_id: nil,
        # Description shown under the heading on the hosted preferences page.
        description: nil,
        # Heading shown at the top of the hosted preferences page.
        heading: nil
      )
      end

      sig do
        override.returns(
          {
            brand_id: T.nilable(String),
            description: T.nilable(String),
            heading: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
