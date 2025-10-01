# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Brands#create
    class Brand < Courier::Internal::Type::BaseModel
      # @!attribute created
      #   The date/time of when the brand was created. Represented in milliseconds since
      #   Unix epoch.
      #
      #   @return [Integer]
      required :created, Integer

      # @!attribute name
      #   Brand name
      #
      #   @return [String]
      required :name, String

      # @!attribute published
      #   The date/time of when the brand was published. Represented in milliseconds since
      #   Unix epoch.
      #
      #   @return [Integer]
      required :published, Integer

      # @!attribute settings
      #
      #   @return [Courier::Models::BrandSettings]
      required :settings, -> { Courier::BrandSettings }

      # @!attribute updated
      #   The date/time of when the brand was updated. Represented in milliseconds since
      #   Unix epoch.
      #
      #   @return [Integer]
      required :updated, Integer

      # @!attribute version
      #   The version identifier for the brand
      #
      #   @return [String]
      required :version, String

      # @!attribute id
      #   Brand Identifier
      #
      #   @return [String, nil]
      optional :id, String, nil?: true

      # @!attribute snippets
      #
      #   @return [Courier::Models::BrandSnippets, nil]
      optional :snippets, -> { Courier::BrandSnippets }, nil?: true

      # @!method initialize(created:, name:, published:, settings:, updated:, version:, id: nil, snippets: nil)
      #   Some parameter documentations has been truncated, see {Courier::Models::Brand}
      #   for more details.
      #
      #   @param created [Integer] The date/time of when the brand was created. Represented in milliseconds since U
      #
      #   @param name [String] Brand name
      #
      #   @param published [Integer] The date/time of when the brand was published. Represented in milliseconds since
      #
      #   @param settings [Courier::Models::BrandSettings]
      #
      #   @param updated [Integer] The date/time of when the brand was updated. Represented in milliseconds since U
      #
      #   @param version [String] The version identifier for the brand
      #
      #   @param id [String, nil] Brand Identifier
      #
      #   @param snippets [Courier::Models::BrandSnippets, nil]
    end
  end
end
