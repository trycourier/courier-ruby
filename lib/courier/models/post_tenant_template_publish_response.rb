# frozen_string_literal: true

module Courier
  module Models
    class PostTenantTemplatePublishResponse < Courier::Internal::Type::BaseModel
      # @!attribute id
      #   The template ID
      #
      #   @return [String]
      required :id, String

      # @!attribute published_at
      #   The timestamp when the template was published
      #
      #   @return [String]
      required :published_at, String

      # @!attribute version
      #   The published version of the template
      #
      #   @return [String]
      required :version, String

      # @!method initialize(id:, published_at:, version:)
      #   Response from publishing a tenant template
      #
      #   @param id [String] The template ID
      #
      #   @param published_at [String] The timestamp when the template was published
      #
      #   @param version [String] The published version of the template
    end
  end
end
