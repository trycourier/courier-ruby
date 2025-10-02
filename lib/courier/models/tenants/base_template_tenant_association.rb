# frozen_string_literal: true

module Courier
  module Models
    module Tenants
      # @see Courier::Resources::Tenants::Templates#retrieve
      class BaseTemplateTenantAssociation < Courier::Internal::Type::BaseModel
        # @!attribute id
        #   The template's id
        #
        #   @return [String]
        required :id, String

        # @!attribute created_at
        #   The timestamp at which the template was created
        #
        #   @return [String]
        required :created_at, String

        # @!attribute published_at
        #   The timestamp at which the template was published
        #
        #   @return [String]
        required :published_at, String

        # @!attribute updated_at
        #   The timestamp at which the template was last updated
        #
        #   @return [String]
        required :updated_at, String

        # @!attribute version
        #   The version of the template
        #
        #   @return [String]
        required :version, String

        # @!method initialize(id:, created_at:, published_at:, updated_at:, version:)
        #   @param id [String] The template's id
        #
        #   @param created_at [String] The timestamp at which the template was created
        #
        #   @param published_at [String] The timestamp at which the template was published
        #
        #   @param updated_at [String] The timestamp at which the template was last updated
        #
        #   @param version [String] The version of the template
      end
    end
  end
end
