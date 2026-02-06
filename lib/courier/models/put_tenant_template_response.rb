# frozen_string_literal: true

module Courier
  module Models
    class PutTenantTemplateResponse < Courier::Internal::Type::BaseModel
      # @!attribute id
      #   The template ID
      #
      #   @return [String]
      required :id, String

      # @!attribute version
      #   The version of the saved template
      #
      #   @return [String]
      required :version, String

      # @!attribute published_at
      #   The timestamp when the template was published. Only present if the template was
      #   published as part of this request.
      #
      #   @return [String, nil]
      optional :published_at, String, nil?: true

      # @!method initialize(id:, version:, published_at: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::PutTenantTemplateResponse} for more details.
      #
      #   Response from creating or updating a tenant notification template
      #
      #   @param id [String] The template ID
      #
      #   @param version [String] The version of the saved template
      #
      #   @param published_at [String, nil] The timestamp when the template was published. Only present if the template was
    end
  end
end
