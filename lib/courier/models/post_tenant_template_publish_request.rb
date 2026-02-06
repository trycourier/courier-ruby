# frozen_string_literal: true

module Courier
  module Models
    class PostTenantTemplatePublishRequest < Courier::Internal::Type::BaseModel
      # @!attribute version
      #   The version of the template to publish (e.g., "v1", "v2", "latest"). If not
      #   provided, defaults to "latest".
      #
      #   @return [String, nil]
      optional :version, String

      # @!method initialize(version: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::PostTenantTemplatePublishRequest} for more details.
      #
      #   Request body for publishing a tenant template version
      #
      #   @param version [String] The version of the template to publish (e.g., "v1", "v2", "latest"). If not prov
    end
  end
end
