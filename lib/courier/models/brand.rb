# frozen_string_literal: true

module Courier
  module Models
    class Brand < Courier::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute created
      #
      #   @return [Integer]
      required :created, Integer

      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute updated
      #
      #   @return [Integer]
      required :updated, Integer

      # @!attribute published
      #
      #   @return [Integer, nil]
      optional :published, Integer, nil?: true

      # @!attribute settings
      #
      #   @return [Courier::Models::BrandSettings, nil]
      optional :settings, -> { Courier::BrandSettings }, nil?: true

      # @!attribute snippets
      #
      #   @return [Courier::Models::BrandSnippets, nil]
      optional :snippets, -> { Courier::BrandSnippets }, nil?: true

      # @!attribute version
      #
      #   @return [String, nil]
      optional :version, String, nil?: true

      # @!method initialize(id:, created:, name:, updated:, published: nil, settings: nil, snippets: nil, version: nil)
      #   @param id [String]
      #   @param created [Integer]
      #   @param name [String]
      #   @param updated [Integer]
      #   @param published [Integer, nil]
      #   @param settings [Courier::Models::BrandSettings, nil]
      #   @param snippets [Courier::Models::BrandSnippets, nil]
      #   @param version [String, nil]
    end
  end
end
