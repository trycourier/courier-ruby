# frozen_string_literal: true

module Courier
  module Models
    class PublishPreferencesRequest < Courier::Internal::Type::BaseModel
      # @!attribute brand_id
      #   Brand for the hosted page - "default" (workspace default brand), "none" (no
      #   brand), or a specific brand id. Defaults to "default".
      #
      #   @return [String, nil]
      optional :brand_id, String, nil?: true

      # @!attribute description
      #   Description shown under the heading on the hosted preferences page.
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute heading
      #   Heading shown at the top of the hosted preferences page.
      #
      #   @return [String, nil]
      optional :heading, String, nil?: true

      # @!method initialize(brand_id: nil, description: nil, heading: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::PublishPreferencesRequest} for more details.
      #
      #   Optional page metadata to apply when publishing the workspace's preferences
      #   page. All fields are optional; omitted fields fall back to the page defaults
      #   (and the workspace default brand).
      #
      #   @param brand_id [String, nil] Brand for the hosted page - "default" (workspace default brand), "none" (no bran
      #
      #   @param description [String, nil] Description shown under the heading on the hosted preferences page.
      #
      #   @param heading [String, nil] Heading shown at the top of the hosted preferences page.
    end
  end
end
